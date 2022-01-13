//
//  ResignationVCViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 26/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ResignationVC: UIViewController {
  @IBOutlet weak var reasonResignationTF: CMTextField!
  @IBOutlet weak var sendBtn: UIButton!
  @IBOutlet weak var imagelogo: UIImageView!
  
  let db = Firestore.firestore()
  var employee:Employee!
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    sendBtn.cmShadow()
    self.dismissKeyboard()
  }
  
  
  @IBAction func sendPressed(_ sender: UIButton) {
    let washingtonRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
    washingtonRef.updateData([
      "resignation": reasonResignationTF.text!
    ]) { err in
      if let err = err {
        print("Error updating document: \(err)")
      } else {
        print("Document successfully updated")
      }
    }
  }
}





