//
//  ViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpBossVC: UIViewController {
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
  
  // MARK: - Methods
  
  @IBAction func signUpPressed(_ sender: UIButton) {
    if passwordTF.text == confirmPassTF.text{
    Auth.auth().createUser(withEmail: emailTF.text!,
                           password: passwordTF.text!) { authDataResult, error in
      if error == nil{
        self.boss = Boss.init(name: self.nameTF.text!,
                              phone: self.mobileTF.text!,
                              email: self.emailTF.text!,
                              id: self.idTF.text!)
        self.saveBoss(self.boss)
        print("Sign Up Successful")
        let vc = BossTBC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        let alert = UIAlertController(title: "succeeded", message: "User Login", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }else{
        print("Error \(error?.localizedDescription)")
        let alert = UIAlertController(title: "Error",message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
    }
      
    }else{
      let alert = UIAlertController(title: "Error",message: "Check Conforom Password", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
      print("Error")
    }
    
  }
  
  
  
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



