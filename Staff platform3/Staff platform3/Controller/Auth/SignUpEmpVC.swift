//
//  SignUpEmpVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpEmpVC: UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: MainTF!
  @IBOutlet weak var emaiTF: MainTF!
  @IBOutlet weak var mobileTF: MainTF!
  @IBOutlet weak var idTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  @IBOutlet weak var SignUpBtn: UIButton!
  @IBOutlet weak var LoginBtn: UIButton!
  
  let db = Firestore.firestore()
  var employee:Employee!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    conerReduis()
    shadow()
  }
  
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    Auth.auth().createUser(withEmail: emaiTF.text!, password: passwordTF.text!) { authResult, error in
      if error == nil{
        self.employee = Employee.init(name: self.nameTF.text!,
                                      email: self.emaiTF.text!,
                                      phone: self.mobileTF.text!,
                                      id: self.idTF.text!,
                                      task: "",evaluation: "")
        
        self.saveEmployee(self.employee)
        print("Sign Up Successful")
        let vc = EmployeeTBC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        
      }else{
        print("Error\(error?.localizedDescription)")
      }
    }
  }
  
  
  func saveEmployee(_ employee: Employee) {
    let docData: [String: Any] = [
      "name": employee.name,
      "email": employee.email,
      "phone": employee.phone,
      "id":employee.id,
      "userType":UserType.EMPLOYEE.rawValue
    ]
    
    db.collection("Users").document(Auth.auth().currentUser!.uid).setData(docData) { err in
      if let err = err {
        print("Error writing document: \(err)")
      } else {
        print("Document successfully written!")
      }
    }
  }
}
extension SignUpEmpVC :Storyboarded{
    static var storyboardName: StoryboardName = .main
}

