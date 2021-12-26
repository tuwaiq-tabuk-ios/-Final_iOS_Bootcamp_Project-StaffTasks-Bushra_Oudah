//
//  EditeMobileVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class EditeMobileVC : UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var newMobileTF: MainTF!
  @IBOutlet weak var saveBtn: UIButton!
  
  var boos:Boos!
  var employee:Employee!
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      conerReduis()
      shadow()
  }
  
  func updateMobileEmployee(_ employee:Employee) {
    let user = Auth.auth().currentUser?.uid
    let docData: [String: Any] = [
      "name": employee.name,
      "email": employee.email,
      "phone": employee.phone,
      "id":employee.id,
      "userType":UserType.EMPLOYEE.rawValue
    ]
    
    db.collection("Users").document(user!).setData(docData) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
  
  func updateMobileBoos() {
    let user = Auth.auth().currentUser?.uid
    let docData: [String: Any] = [
      "name": boos.name,
      "email": boos.email,
      "phone": boos.phone,
      "id":boos.id,

      "userType":UserType.EMPLOYEE.rawValue
    ]
    
    db.collection("Users").document(user!).setData(docData) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
              
        
  @IBAction func updateDataPressed(_ sender: UIButton) {
    self.employee = Employee.init(name: employee.name, email: employee.email, phone: self.newMobileTF.text, id: employee.id, task: employee.task, evaluation: employee.evaluation
    )
    updateMobileEmployee(self.employee)
      }
    
  
}
