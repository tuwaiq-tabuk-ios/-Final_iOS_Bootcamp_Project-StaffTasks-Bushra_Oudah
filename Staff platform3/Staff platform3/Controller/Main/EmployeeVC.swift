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
                           self.employee.remove(at: indexPath.row)
                           tableView.deleteRows(at: [indexPath], with: .fade)
                       }
                   }
               } else  {
                   print("error")
               }
           
         
     
   }
     func readEmployee(){
         db.collection("Users").addSnapshotListener { (querySnapshot, error) in
             self.employee = []
             guard let documents = querySnapshot?.documents else {
                     print("Error fetching documents: \(error!)")
                     return
         }
             for doc in documents{
                do{
                 if (doc.data()["userType"] as? String == UserType.EMPLOYEE.rawValue){
                     let employee = try doc.data(as: Employee.self)
                     if let employee = employee {
                      self.employee.append(employee)
                      }
                     self.tabelView.reloadData()
                 }
  
         }catch let error{
         print("Error\(error.localizedDescription)")
             }
             }
         }
     }
  

  let updateSegueIdentifier = "DetailsSegue"
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == updateSegueIdentifier {
          let destination =  segue.destination as! DetailsEmployeeVC
          destination.employees = selectedEmployee
      }
  }


 }
