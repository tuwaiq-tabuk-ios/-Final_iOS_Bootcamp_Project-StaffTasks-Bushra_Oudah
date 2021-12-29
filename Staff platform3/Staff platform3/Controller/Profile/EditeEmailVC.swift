//
//  EditeEmailVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//
import UIKit
import Firebase
import FirebaseFirestore

class EditeEmailVC : UIViewController {


let db = Firestore.firestore()
    @IBOutlet weak var imageLog: UIImageView!
    @IBOutlet weak var newEmailTF: CMTextField!
    @IBOutlet weak var saveBotn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    saveBotn.cmShadow()
  }
  
  @IBAction func updateDataPressed(_ sender: UIButton) {
    Auth.auth().currentUser?.updateEmail(to: newEmailTF.text!) { [self] error in
      if error == nil{
        let washingtonRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
        washingtonRef.updateData([
            "email": newEmailTF.text!
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
      }
    }
  }
}
