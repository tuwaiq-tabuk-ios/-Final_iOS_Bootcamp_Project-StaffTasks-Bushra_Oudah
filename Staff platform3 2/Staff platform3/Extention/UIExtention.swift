
import Foundation
import UIKit


//extension ProfileVC {
//
//  func conerReduis() {
//    nameLabel.layer.cornerRadius = 25
//    nameLabel.layer.borderWidth = 1
//    nameLabel.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    emailLabel.layer.cornerRadius = 20
//    emailLabel.layer.borderWidth = 1
//    emailLabel.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    PhoneLabel.layer.cornerRadius = 20
//    PhoneLabel.layer.borderWidth = 1
//    PhoneLabel.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    idLabel.layer.cornerRadius = 20
//    idLabel.layer.borderWidth = 1
//    idLabel.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//  }
//}
//
//extension SettingVC {
//
//  func conerReduis() {
//    languageBtn.layer.cornerRadius = 25
//    languageBtn.layer.borderWidth = 1
//    languageBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    updatePassBtn.layer.cornerRadius = 20
//    updatePassBtn.layer.borderWidth = 1
//    updatePassBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    updateNameBtn.layer.cornerRadius = 20
//    updateNameBtn.layer.borderWidth = 1
//    updateNameBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//
//    signOut.layer.cornerRadius = 20
//    signOut.layer.borderWidth = 1
//    signOut.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//  }
//  func shadow(){
//    languageBtn.layer.shadowColor = UIColor.black.cgColor
//    languageBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    languageBtn.layer.shadowRadius = 8
//    languageBtn.layer.shadowOpacity = 0.5
//    languageBtn.layer.masksToBounds = false
//
//
//    updatePassBtn.layer.shadowColor = UIColor.black.cgColor
//    updatePassBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    updatePassBtn.layer.shadowRadius = 8
//    updatePassBtn.layer.shadowOpacity = 0.5
//    updatePassBtn.layer.masksToBounds = false
//
//    updateNameBtn.layer.shadowColor = UIColor.black.cgColor
//    updateNameBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    updateNameBtn.layer.shadowRadius = 8
//    updateNameBtn.layer.shadowOpacity = 0.5
//    updateNameBtn.layer.masksToBounds = false
//
//    signOut.layer.shadowColor = UIColor.black.cgColor
//    signOut.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    signOut.layer.shadowRadius = 8
//    signOut.layer.shadowOpacity = 0.5
//    signOut.layer.masksToBounds = false
//
//  }
//}
//
//extension EditPasswordVC {
//
//  func conerReduis() {
//    saveBtn.layer.cornerRadius = 25
//    saveBtn.layer.borderWidth = 1
//    saveBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//  }
//}
//
//extension EditeEmailVC {
//
//  func conerReduis() {
//    saveBotn.layer.cornerRadius = 25
//    saveBotn.layer.borderWidth = 1
//    saveBotn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
//  }
//  func shadow(){
//    saveBotn.layer.shadowColor = UIColor.black.cgColor
//    saveBotn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    saveBotn.layer.shadowRadius = 8
//    saveBotn.layer.shadowOpacity = 0.5
//    saveBotn.layer.masksToBounds = false
//
//
//  }
//}
//
extension HomeVC {

  func conerReduis() {
    bossButton.layer.cornerRadius = 25
    bossButton.layer.borderWidth = 1
    employeeButton.layer.cornerRadius = 25
    employeeButton.layer.borderWidth = 1
    bossButton.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
    employeeButton.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
  }

  func shadow(){
    bossButton.layer.shadowColor = UIColor.black.cgColor
    bossButton.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    bossButton.layer.shadowRadius = 8
    bossButton.layer.shadowOpacity = 0.5
    bossButton.layer.masksToBounds = false

  }
}

extension SignUpBossVC {
  
  func cornerRadios() {
    SignUp.layer.cornerRadius = 25
    SignUp.layer.borderWidth = 1
    SignUp.layer.cornerRadius = 20
    SignUp.layer.borderWidth = 1
    SignUp.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
    Login.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
  }
  
  
  func shadow(){
    SignUp.layer.shadowColor = UIColor.black.cgColor
    SignUp.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    SignUp.layer.shadowRadius = 8
    SignUp.layer.shadowOpacity = 0.5
    SignUp.layer.masksToBounds = false
  }
  
}

extension SignUpEmpVC {
  
  func conerReduis() {
    SignUpBtn.layer.cornerRadius = 25
    SignUpBtn.layer.borderWidth = 1
    LoginBtn.layer.cornerRadius = 25
    LoginBtn.layer.borderWidth = 1
    SignUpBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
    LoginBtn.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
  }
  
  func shadow(){
    SignUpBtn.layer.shadowColor = UIColor.black.cgColor
    SignUpBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    SignUpBtn.layer.shadowRadius = 8
    SignUpBtn.layer.shadowOpacity = 0.5
    SignUpBtn.layer.masksToBounds = false
    
  }
}

extension LoginVC {
  
  func conerReduis() {
    login.layer.cornerRadius = 25
    login.layer.borderWidth = 1
    signUp.layer.cornerRadius = 25
    signUp.layer.borderWidth = 1
    signUp.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
    signUp.layer.borderColor = UIColor(red: 208/255, green: 44/255, blue: 166/255, alpha: 100).cgColor
  }
  
  func shadow(){
    login.layer.shadowColor = UIColor.black.cgColor
    login.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    login.layer.shadowRadius = 8
    login.layer.shadowOpacity = 0.5
    login.layer.masksToBounds = false
    
  }
  
  
}

//extension ForgotPasswordVC {
//  func conerReduis(){
//    sendEmailBtn.layer.cornerRadius = 20
//    sendEmailBtn.layer.borderWidth = 1
//    sendEmailBtn.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//  }
//  func shadow(){
//    sendEmailBtn.layer.shadowColor = UIColor.black.cgColor
//    sendEmailBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//    sendEmailBtn.layer.shadowRadius = 8
//    sendEmailBtn.layer.shadowOpacity = 0.5
//    sendEmailBtn.layer.masksToBounds = false
//  }
//}
//
//extension EmployeeCell {
//  
//  
//  func conerReduis(){
//      nameLabel.layer.cornerRadius = 15
//      nameLabel.layer.borderWidth = 1
//      nameLabel.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//      idLabel.layer.cornerRadius = 15
//      idLabel.layer.borderWidth = 1
//      idLabel.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//      
//      rateBtn.layer.cornerRadius = 15
//      rateBtn.layer.borderWidth = 1
//      rateBtn.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//
//      taskBtn.layer.cornerRadius = 15
//      taskBtn.layer.borderWidth = 1
//      taskBtn.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//
//}
//  
//  func shadow(){
//      taskBtn.layer.shadowColor = UIColor.black.cgColor
//      taskBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//      taskBtn.layer.shadowRadius = 8
//      taskBtn.layer.shadowOpacity = 0.5
//      taskBtn.layer.masksToBounds = false
//      
//      
//      rateBtn.layer.shadowColor = UIColor.black.cgColor
//      rateBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//      rateBtn.layer.shadowRadius = 8
//      rateBtn.layer.shadowOpacity = 0.5
//      rateBtn.layer.masksToBounds = false
//     
//  }
//}
//  
//extension EvaluationCell {
//  
//  func conerReduis(){
//      evaluationLabel.layer.cornerRadius = 15
//      evaluationLabel.layer.borderWidth = 1
//      evaluationLabel.layer.borderColor =  UIColor(red:208/255, green:44/255, blue:166/255, alpha: 100).cgColor
//  }
//
//  
//}
