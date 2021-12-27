//
//  EditePasswordVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//


import UIKit
import Firebase
class EditePasswordVC: UIViewController  {
  

  
  @IBOutlet weak var EmailTF:MainTF!
  
  @IBOutlet weak var sendBtn: UIButton!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      conerReduis()
  }
  
  @IBAction func sendPressed(_ sender: Any) {
    Auth.auth().sendPasswordReset(withEmail: EmailTF.text!) { error in
      if error == nil{
        print("Sign Up Successful")
      }else{
        print("Error \(error?.localizedDescription)")
      }
    }
  }
}

