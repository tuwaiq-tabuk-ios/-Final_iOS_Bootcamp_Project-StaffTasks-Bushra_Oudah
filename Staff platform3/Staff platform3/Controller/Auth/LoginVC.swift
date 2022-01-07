//
//  LoginVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var emailTF: CMTextField!
  @IBOutlet weak var passwordTF: CMTextField!
  @IBOutlet weak var login: UIButton!
  @IBOutlet weak var signUp: UIButton!
  @IBOutlet weak var forgetPassword: UIButton!
  
  var boos:Boos!
  var employee:Employee!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    login.cmShadow()
    signUp.cmShadow()
    overrideUserInterfaceStyle = .light 
  }
  
  
  @IBAction func loginPreesed(_ sender: UIButton) {
    Auth.auth().signIn(withEmail: emailTF.text!,
                       password: passwordTF.text!)
    
    { [weak self] authResult, error in
      guard let self = self else { return }
      if error == nil{
        print("Login Successful")

          let vc = BoosTBC.instantiate()
          self.navigationController?.pushViewController(vc, animated: true)
      //  }else{
//          let vc = EmployeeTBC.instantiate()
//          self.navigationController?.pushViewController(vc, animated: true)
        let alert = UIAlertController(title: "succeeded", message: "User Login", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
     //   }

      }else{
        print("error\(error?.localizedDescription)")
        
        let alert = UIAlertController(title: "Error",message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
    }
  }
}

extension LoginVC :Storyboarded{
    static var storyboardName: StoryboardName = .main
}
