//
//  EditeEmailVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//
import UIKit
import Firebase

class EditeEmailVC : UIViewController {
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var newEmailTF: CMTextField!
  
  @IBOutlet weak var saveBotn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    saveBotn.cmShadow()
  }
  
  @IBAction func updateDataPressed(_ sender: UIButton) {
    Auth.auth().currentUser?.updateEmail(to: newEmailTF.text!) { error in
      if error == nil{
        print("Rest Successful")
      }else{
        print("error\(error?.localizedDescription)")
      }
    }
  }
  
  
}

