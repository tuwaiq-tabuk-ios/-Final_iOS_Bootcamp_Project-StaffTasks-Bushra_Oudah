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

class EmployeeVC: UIViewController {
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employee = [Employee]()
  var selectedEmployee : Employee?
  
  
  
  // MARK: - IBOutlets
  
  @IBOutlet var tabelView: UITableView!
  
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readEmployee()
    overrideUserInterfaceStyle = .light
  }
  
  
  
  // MARK: - Methods
  
  func readEmployee(){
    db
      .collection("Users")
      .addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("Error fetching documents: \(error!)")
          return
        }
        
        self.employee = []
        
        for doc in documents {
          if (doc.data()["userType"] as? String == UserType.EMPLOYEE.rawValue) {
            print("doc.documentID\(doc.documentID)")
            let name = doc.data()["name"] as? String
            let employees = Employee(id:doc.documentID, name: name, email: nil, phone: nil, idNumber: nil,task: nil,evaluation: nil, resignation: nil, holiday: nil,active: nil,user:nil,zoomURL: nil, payroll: nil, timeOfVication: nil)
            self.employee.append(employees)
            
          }
        }
        self.tabelView.reloadData()
      }
  }
  
}



// MARK: - Table data source

extension EmployeeVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employee.count
    
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as! EmployeeCell
    cell.nameLabel.text = employee[indexPath.row].name
   
    return cell
  }
  
  
  func tableView(_ tableView: UITableView,
                 commit editingStyle: UITableViewCellEditingStyle,
                 forRowAt indexPath: IndexPath) {
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
}



// MARK: - Navigation

extension EmployeeVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tabelView.deselectRow(at: indexPath, animated: true)
    selectedEmployee = employee[indexPath.row]
    
    performSegue(withIdentifier: K.Storyboard.segueIdentifierDetailsEmployeeVC,
                 sender: nil)
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == K.Storyboard.segueIdentifierDetailsEmployeeVC {
      let destination =  segue.destination as! EmployeeDetailsVC
      if let row = tabelView.indexPathForSelectedRow?.row {
        destination.employee = employee[ row ]
        
      }
    }
  }
}
