//
//  SettingBoosVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 02/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
class SettingBoosVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      overrideUserInterfaceStyle = .light
        // Do any additional setup after loading the view.
    }
  @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
    let firebaseAuth = Auth.auth()

    do {
      try firebaseAuth.signOut()
        let vc = HomeVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        
        print("signOut")
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  
  }

}
