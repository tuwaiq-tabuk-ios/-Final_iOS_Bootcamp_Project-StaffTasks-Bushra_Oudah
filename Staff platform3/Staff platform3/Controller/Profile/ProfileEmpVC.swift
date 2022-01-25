//
//  ProfileVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//


import UIKit
import Firebase
import FirebaseFirestore


class ProfileEmpVC: UIViewController {
  
  // MARK: - Properties
  
  var boos = [Boss]()
  var employee = [Employee]()
  let db = Firestore.firestore()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var PhoneLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  
  // MARK: - View controller lifecycle
  
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
          self.idLabel.text = document.data()?["idNumber"] as? String
          
          _ = Employee(name: self.nameLabel.text!,
                       email: self.emailLabel.text!,
                       phone: self.PhoneLabel.text!,
                       idNumber: self.idLabel.text!,
                       task: nil,
                       evaluation: nil,
                       resignation: nil,
                       holiday: nil,active: nil,user:nil,zoomURL: nil, payroll: nil, timeOfVication: nil)
          
          print("Document data")
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
      
    }
  }
  
}
