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
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var newEmailTF: CMTextField!
  @IBOutlet weak var saveBotn: UIButton!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    saveBotn.cmShadow()
    self.dismissKeyboard()
  }
  
  
  // MARK: - Methods
  
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
    let alert1 = UIAlertController(title: "succeeded", message: "The Email has been changed", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
  }
}
