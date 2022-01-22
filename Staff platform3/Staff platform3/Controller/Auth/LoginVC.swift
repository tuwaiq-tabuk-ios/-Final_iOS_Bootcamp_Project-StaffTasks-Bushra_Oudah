//
//  LoginVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit
import Firebase

class LoginVC: UIViewController,AlertsPresenting {
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var boos:Boss!
  var employee:Employee!
  
  // MARK: - IBOoutLet
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var emailTF: CMTextField!
  @IBOutlet weak var passwordTF: CMTextField!
  @IBOutlet weak var loginBotn: UIButton!
  @IBOutlet weak var signUpBotn: UIButton!
  @IBOutlet weak var forgetPasswordBton: UIButton!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    loginBotn.cmShadow()
    signUpBotn.cmShadow()
    overrideUserInterfaceStyle = .light
    self.dismissKeyboard()
  }
  
  // MARK: - Methods
  
  @IBAction func loginPreesed(_ sender: UIButton) {
    do{
      let email = try emailTF.validatedText(validationType: .requiredField(field: "email"))
      let password = try passwordTF.validatedText(validationType: .requiredField(field: "password"))
      Auth.auth().signIn(withEmail: email,
                         password: password)
      { [weak self] authResult, error in
        guard let self = self else { return }
        if error == nil{
          print("Login Successful")
          if let emailTF  = Auth.auth().currentUser?.email {
            self.db.collection("Users").whereField("email", isEqualTo: emailTF).getDocuments(){ (querySnapshot, err) in
              if let err = err {
                print("Error getting documents: \(err)")
              } else {
                guard let documents = querySnapshot?.documents else {
                  print("Error fetching documents: \(error!)")
                  return
                }
                if let firstResult = documents.first{
                  if let type = firstResult.data()["userType"] as? String{
                    let userType = UserType(rawValue: type)
                    switch userType {
                    case .BOSS:
                      let vc = BossTBC.instantiate()
                      self.navigationController?.pushViewController(vc, animated: true)
                      self.showAlert(title: "Login", message: "Login Success")
                    case .EMPLOYEE:
                      let vc = EmployeeTBC.instantiate()
                      self.navigationController?.pushViewController(vc, animated: true)
                    case .none:
                      fatalError("Unexptcted case")
                    }
                  }
                }
              }
            }
          }
        }else{
          print("error\(error?.localizedDescription)")
          self.showAlert(title: "Error", message: error?.localizedDescription)
        }
      }
    }catch(let error){
      self.showAlert(title: "Error", message: (error as!  ValidationError).message)
    }
    
  }
}
// MARK: - Navigation


extension LoginVC :Storyboarded{
  static var storyboardName: StoryboardName = .main
}
