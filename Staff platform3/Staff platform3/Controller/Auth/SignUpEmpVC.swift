//
//  SignUpEmpVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpEmpVC: UIViewController,AlertsPresenting {
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employee:Employee!
  
  // MARK: - IBOoutLet
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: CMTextField!
  @IBOutlet weak var emailTF: CMTextField!
  @IBOutlet weak var mobileTF: CMTextField!
  @IBOutlet weak var idTF: CMTextField!
  @IBOutlet weak var passwordTF: CMTextField!
  @IBOutlet weak var SignUpBtn: UIButton!
  @IBOutlet weak var LoginBtn: UIButton!
  @IBOutlet weak var confirmPassTF: CMTextField!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    SignUpBtn.cmShadow()
    LoginBtn.cmShadow()
    overrideUserInterfaceStyle = .light
    self.dismissKeyboard()
  }
  
  // MARK: - IBAction
  
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    do{
      let email = try emailTF.validatedText(validationType: .email)
      let password = try passwordTF.validatedText(validationType: .requiredField(field: "Password"))
      let passConfirm = try confirmPassTF.validatedText(validationType: .requiredField(field: "Password"))
      let phone = try mobileTF.validatedText(validationType: .requiredField(field: "Phone Number"))
      let name = try nameTF.validatedText(validationType: .username)
      let id = try idTF.validatedText(validationType: .requiredField(field: "ID"))
      if password == passConfirm{
        Auth.auth().createUser(withEmail: email,
                               password: password) { authResult, error in
          if error == nil{
            self.employee = Employee.init(name: name,
                                          email: email,
                                          phone: phone,
                                          idNumber: id,
                                          task: nil ,evaluation: nil, resignation: nil,
                                          holiday: nil,active: nil,user:nil,zoomURL: nil, payroll: nil, timeOfVication: nil)
            self.saveEmployee(self.employee)
            print("Sign Up Successful")
            let vc = EmployeeTBC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            self.showAlert(title: "Staff Task", message: "Welcome")
          }else{
            print("Error\(error?.localizedDescription)")
            self.showAlert(title: "Error", message: error?.localizedDescription)
          }
        }
      }else{
        self.showAlert(title: "Error", message: "Check confirm Password")
      }
    }
    catch(let error){
      self.showAlert(title: "Error", message: (error as! ValidationError).message )
    }
  }
  
  // MARK: - Methods

  
  func saveEmployee(_ employee: Employee) {
    let docData: [String: Any] = [
      "name": employee.name,
      "email": employee.email,
      "phone": employee.phone,
      "idNumber":employee.idNumber,
      "evaluation":employee.evaluation,
      "task":employee.task,
      "active":"active",
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

// MARK: - Navigation

extension SignUpEmpVC :Storyboarded{
  static var storyboardName: StoryboardName = .main
}

