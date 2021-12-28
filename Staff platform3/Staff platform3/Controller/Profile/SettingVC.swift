//
//  SettingVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit
import Firebase


class SettingVC: UIViewController{
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var languageBtn: UIButton!
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var updateEmail: UIButton!
  @IBOutlet weak var updateMobile: UIButton!
  @IBOutlet weak var signOut: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    languageBtn.cmShadow()
    updatePassBtn.cmShadow()
    updateEmail.cmShadow()
    updateMobile.cmShadow()
    signOut.cmShadow()
    
  }
  
  
  @IBAction func signOutPressed(_ sender: UIButton) {
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      self.navigationController?.popToRootViewController(animated: true)
      print("signOut")
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    
  }
  
}

