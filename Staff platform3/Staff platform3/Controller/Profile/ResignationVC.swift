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
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employee:Employee!
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var reasonResignationTF: CMTextField!
  @IBOutlet weak var sendBtn: UIButton!
  @IBOutlet weak var imagelogo: UIImageView!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    sendBtn.cmShadow()
    self.dismissKeyboard()
  }
  
  // MARK: - Methods
  
  
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
    let alert1 = UIAlertController(title: "succeeded", message: "The reason Resignation has been Sended", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
  }
}





