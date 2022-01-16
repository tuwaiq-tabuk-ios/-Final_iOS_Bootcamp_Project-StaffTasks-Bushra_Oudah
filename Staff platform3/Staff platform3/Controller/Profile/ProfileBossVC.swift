//
//  ProfileBoosVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 03/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class ProfileBossVC: UIViewController {
  
  // MARK: - Properties
  
  var boss = [Boss]()
  var employee = [Employee]()
  let db = Firestore.firestore()
  
  // MARK: - IBOoutLet
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var PhoneLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  
  // View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    readUsers()
    overrideUserInterfaceStyle = .light
  }
  
  // MARK: - Methods
  
  
  func readUsers(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          self.nameLabel.text = document.data()?["name"] as? String
          self.emailLabel.text = document.data()?["email"] as? String
          self.PhoneLabel.text = document.data()?["phone"] as? String
          self.idLabel.text = document.data()?["id"] as? String
          _ = Boss.init(name: self.nameLabel.text, phone: self.PhoneLabel.text!, email: self.emailLabel.text!, id: self.idLabel.text)
          print("Document data")
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
    }
  }
}
