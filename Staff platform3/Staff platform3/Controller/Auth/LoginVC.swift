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
  @IBOutlet weak var emailTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  @IBOutlet weak var login: UIButton!
  @IBOutlet weak var signUp: UIButton!
  @IBOutlet weak var forgetPassword: UIButton!
  
  var boos:Boos!
  var employee:Employee!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    shadow()
    conerReduis()
  }
  
  
  @IBAction func loginPreesed(_ sender: UIButton) {
    Auth.auth().signIn(withEmail: emailTF.text!,
                       password: passwordTF.text!)
    
    { [weak self] authResult, error in
      guard let self = self else { return }
      if error == nil{
        print("Login Successful")
        let vc = EmployeeTBC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
      }else{
        print("error\(error?.localizedDescription)")
      }
    }
  }
}

extension LoginVC :Storyboarded{
    static var storyboardName: StoryboardName = .main
}
