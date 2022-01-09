//
//  EmployeeVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 02/06/1443 AH.
//

import UIKit
import Firebase
import PDFKit
import FirebaseFirestoreSwift
import FirebaseFirestore

class EmployeeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  
   @IBOutlet var tabelView: UITableView!
  let db = Firestore.firestore()
 var employee = [Employee]()
 var selectedEmployee : Employee?
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readEmployee()
    overrideUserInterfaceStyle = .light
  }
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employee.count
    
  }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as! EmployeeCell
     cell.nameLabel.text = employee[indexPath.row].name
    cell.idLabel.text = employee[indexPath.row].id
    return cell
  }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabelView.deselectRow(at: indexPath, animated: true)
         selectedEmployee = employee[indexPath.row]
         
        performSegue(withIdentifier: "DetailsSegue", sender: nil)
     }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
                  
                  let empoyeeDoc = db.collection("Users").document(employee[indexPath.row].id!)
        empoyeeDoc.delete() { err in
                      if let err = err {
                          print("Error removing document: \(err.localizedDescription)")
                      } else {
                          print("Document successfully removed!")

                      }
                  }
              } else  {
                  print("error")
              }
          
        
    
  }
    func readEmployee(){
      db.collection("Users").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("Error fetching documents: \(error!)")
          return
        }
          self.employee = []
        for doc in documents{
          if (doc.data()["userType"] as? String == UserType.EMPLOYEE.rawValue) {
             print("doc.documentID\(doc.documentID)")
            let name = doc.data()["name"] as? String
            let id = doc.data()["idNumber"] as? String
              let employees = Employee(id:doc.documentID, name: name, email: nil, phone: nil, idNumber: id,task: nil,evaluation: nil, resignation: nil, holiday: nil,active: nil,user:nil,zoomURL: nil)
            self.employee.append(employees)
           
          }
        }
        self.tabelView.reloadData()
      }
    }
 

 let updateSegueIdentifier = "DetailsSegue"
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == updateSegueIdentifier {
         let destination =  segue.destination as! DetailsEmployeeVC
         if let row = tabelView.indexPathForSelectedRow?.row {
             destination.employee = employee[ row ]
             
         }
     }
 }


}
