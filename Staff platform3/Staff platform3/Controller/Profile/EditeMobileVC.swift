//
//  EditeMobileVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class EditeMobileVC : UIViewController {


  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var newMobileTF: CMTextField!
  @IBOutlet weak var saveBtn: UIButton!
  
  var boos:Boos!
  var employee:Employee!
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
      super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    saveBtn.cmShadow()
  }

  @IBAction func updateDataPressed(_ sender: UIButton) {
    let washingtonRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
    washingtonRef.updateData([
        "phone": newMobileTF.text!
    ]) { err in
        if let err = err {
            print("Error updating document: \(err)")
        } else {
            print("Document successfully updated")
        }
    }
  
  }
}


