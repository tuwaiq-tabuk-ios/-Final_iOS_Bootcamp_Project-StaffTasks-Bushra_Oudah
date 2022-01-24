//
//  ViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpBossVC: UIViewController,AlertsPresenting {

  // MARK: - Properties
  
  let db = Firestore.firestore()
  var boss:Boss!
  
  // MARK: - IBOoutLet
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: CMTextField!
  @IBOutlet weak var emailTF: CMTextField!
  @IBOutlet weak var mobileTF: CMTextField!
  @IBOutlet weak var idTF: CMTextField!
  @IBOutlet weak var passwordTF: CMTextField!
  @IBOutlet weak var signUpBtn: UIButton!
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var confirmPassTF: CMTextField!
  
 
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    signUpBtn.cmShadow()
    loginBtn.cmShadow()
    self.dismissKeyboard()
  }
  
  // MARK: - IBAction
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    do{
      let email = try emailTF.validatedText(validationType: .email)
      let password = try confirmPassTF.validatedText(validationType: .requiredField(field: "Password"))
      let passConfirm = try passwordTF.validatedText(validationType: .requiredField(field: "Password"))
    let phone = try mobileTF
        .validatedText(validationType: .requiredField(field: "Phone Number"))
      let name = try nameTF.validatedText(validationType: .username)
      let id = try  idTF.validatedText(validationType: .requiredField(field: "ID"))
      if password == passConfirm{
      Auth.auth().createUser(withEmail: email,
                             password: password) { authDataResult, error in
        if error == nil{
          self.boss = Boss.init(name: name,
                                phone: phone,
                                email: email,
                                id: id)
          self.saveBoss(self.boss)
          print("Sign Up Successful")
          let vc = BossTBC.instantiate()
          self.navigationController?.pushViewController(vc, animated: true)
          self.showAlert(title: "Staff Task", message: "Welcome")
        }else{
          print("Error \(error?.localizedDescription)")
          self.showAlert(title: "Error", message: error?.localizedDescription)
        }
      }
      }else{
        self.showAlert(title: "Error", message: "Check confirm Password")
        print("Error")
      }
    }
    catch(let error){
      self.showAlert(title: "Error", message: (error as! ValidationError).message )
    }
  }
  
  // MARK: - Methods
  
  
  func saveBoss(_ boss: Boss) {
    let docData: [String: Any] = [
      "name": boss.name,
      "email": boss.email,
      "phone": boss.phone,
      "id": boss.id,
      "userType": UserType.BOSS.rawValue
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

extension SignUpBossVC:Storyboarded{
  static var storyboardName: StoryboardName = .main
}



