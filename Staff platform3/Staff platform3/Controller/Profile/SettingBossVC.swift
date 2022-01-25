//
//  SettingBoosVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 02/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore


class SettingBossVC: UIViewController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
  }
  
  // MARK: - IBAction
  
  
  @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      let vc = UINavigationController(rootViewController: HomeVC.instantiate())
      self.sceneDelegate.setRootVC(vc: vc)
      print("signOut")
    }
    catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
}
