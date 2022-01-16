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
  
  // MARK: - Properties
  
  var boss:Boss!
  var employee:Employee!
  let db = Firestore.firestore()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var newMobileTF: CMTextField!
  @IBOutlet weak var saveBtn: UIButton!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    saveBtn.cmShadow()
    self.dismissKeyboard()
  }
  // MARK: - Methods
  
  
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
    let alert1 = UIAlertController(title: "succeeded", message: "The Phone Number has been changed", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
  }
}


