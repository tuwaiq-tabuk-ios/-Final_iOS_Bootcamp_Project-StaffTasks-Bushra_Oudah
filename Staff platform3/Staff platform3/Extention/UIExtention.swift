
import Foundation
import UIKit


//extension ProfileVC {

//  func conerReduis() {
//    nameLabel.layer.cornerRadius = 25
//    nameLabel.layer.borderWidth = 1
//    nameLabel.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
//
//    emailLabel.layer.cornerRadius = 20
//    emailLabel.layer.borderWidth = 1
//    emailLabel.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
//
//    PhoneLabel.layer.cornerRadius = 20
//    PhoneLabel.layer.borderWidth = 1
//    PhoneLabel.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
//
//    idLabel.layer.cornerRadius = 20
//    idLabel.layer.borderWidth = 1
//    idLabel.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
//  }
//}

extension SettingVC {

  func conerReduis() {
    languageBtn.layer.cornerRadius = 25
    languageBtn.layer.borderWidth = 1
    languageBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor

    updatePassBtn.layer.cornerRadius = 20
    updatePassBtn.layer.borderWidth = 1
    updatePassBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor

    updateEmail.layer.cornerRadius = 20
    updateEmail.layer.borderWidth = 1
    updateEmail.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor

    signOut.layer.cornerRadius = 20
    signOut.layer.borderWidth = 1
    signOut.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    
    updateMobile.layer.cornerRadius = 20
    updateMobile.layer.borderWidth = 1
    updateMobile.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  func shadow(){
    languageBtn.layer.shadowColor = UIColor.black.cgColor
    languageBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    languageBtn.layer.shadowRadius = 8
    languageBtn.layer.shadowOpacity = 0.5
    languageBtn.layer.masksToBounds = false


    updatePassBtn.layer.shadowColor = UIColor.black.cgColor
    updatePassBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    updatePassBtn.layer.shadowRadius = 8
    updatePassBtn.layer.shadowOpacity = 0.5
    updatePassBtn.layer.masksToBounds = false

    updateEmail.layer.shadowColor = UIColor.black.cgColor
    updateEmail.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    updateEmail.layer.shadowRadius = 8
    updateEmail.layer.shadowOpacity = 0.5
    updateEmail.layer.masksToBounds = false

    signOut.layer.shadowColor = UIColor.black.cgColor
    signOut.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    signOut.layer.shadowRadius = 8
    signOut.layer.shadowOpacity = 0.5
    signOut.layer.masksToBounds = false

    updateMobile.layer.shadowColor = UIColor.black.cgColor
    updateMobile.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    updateMobile.layer.shadowRadius = 8
    updateMobile.layer.shadowOpacity = 0.5
    updateMobile.layer.masksToBounds = false

  }
}

extension EditePasswordVC {

  func conerReduis() {
    sendBtn.layer.cornerRadius = 25
    sendBtn.layer.borderWidth = 1
    sendBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  func shadow(){
    sendBtn.layer.shadowColor = UIColor.black.cgColor
    sendBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    sendBtn.layer.shadowRadius = 8
    sendBtn.layer.shadowOpacity = 0.5
    sendBtn.layer.masksToBounds = false

}
}

extension EditeEmailVC {

  func conerReduis() {
    saveBotn.layer.cornerRadius = 25
    saveBotn.layer.borderWidth = 1
    saveBotn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  func shadow(){
    saveBotn.layer.shadowColor = UIColor.black.cgColor
    saveBotn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    saveBotn.layer.shadowRadius = 8
    saveBotn.layer.shadowOpacity = 0.5
    saveBotn.layer.masksToBounds = false


  }
}

extension EditeMobileVC {

  func conerReduis() {
    saveBtn.layer.cornerRadius = 25
    saveBtn.layer.borderWidth = 1
    saveBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  func shadow(){
    saveBtn.layer.shadowColor = UIColor.black.cgColor
    saveBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    saveBtn.layer.shadowRadius = 8
    saveBtn.layer.shadowOpacity = 0.5
    saveBtn.layer.masksToBounds = false


  }
}

extension HomeVC {

  func conerReduis() {
    bossButton.layer.cornerRadius = 25
    bossButton.layer.borderWidth = 1
    employeeButton.layer.cornerRadius = 25
    employeeButton.layer.borderWidth = 1
    bossButton.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    employeeButton.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }

  func shadow(){
    bossButton.layer.shadowColor = UIColor.black.cgColor
    bossButton.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    bossButton.layer.shadowRadius = 8
    bossButton.layer.shadowOpacity = 0.5
    bossButton.layer.masksToBounds = false
    employeeButton.layer.shadowColor = UIColor.black.cgColor
    employeeButton.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    employeeButton.layer.shadowRadius = 8
    employeeButton.layer.shadowOpacity = 0.5
    employeeButton.layer.masksToBounds = false

  }
}

extension SignUpBossVC {
  
  func cornerRadios() {
    SignUp.layer.cornerRadius = 25
    SignUp.layer.borderWidth = 1
    Login.layer.cornerRadius = 20
    Login.layer.borderWidth = 1
    SignUp.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    Login.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  
  
  func shadow(){
    SignUp.layer.shadowColor = UIColor.black.cgColor
    SignUp.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    SignUp.layer.shadowRadius = 8
    SignUp.layer.shadowOpacity = 0.5
    SignUp.layer.masksToBounds = false
    
    Login.layer.shadowColor = UIColor.black.cgColor
    Login.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    Login.layer.shadowRadius = 8
    Login.layer.shadowOpacity = 0.5
    Login.layer.masksToBounds = false
  }
  
}

extension SignUpEmpVC {
  
  func conerReduis() {
    SignUpBtn.layer.cornerRadius = 25
    SignUpBtn.layer.borderWidth = 1
    LoginBtn.layer.cornerRadius = 20
    LoginBtn.layer.borderWidth = 1
    SignUpBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    LoginBtn.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
  }
  
  func shadow(){
    SignUpBtn.layer.shadowColor = UIColor.black.cgColor
    SignUpBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    SignUpBtn.layer.shadowRadius = 8
    SignUpBtn.layer.shadowOpacity = 0.5
    SignUpBtn.layer.masksToBounds = false
    
    LoginBtn.layer.shadowColor = UIColor.black.cgColor
    LoginBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    LoginBtn.layer.shadowRadius = 8
    LoginBtn.layer.shadowOpacity = 0.5
    LoginBtn.layer.masksToBounds = false
  }
}

extension LoginVC {
  
  func conerReduis() {
    login.layer.cornerRadius = 25
    login.layer.borderWidth = 1
    signUp.layer.cornerRadius = 20
    signUp.layer.borderWidth = 1
    login.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    signUp.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 100).cgColor
    

  }
  
  func shadow(){
    login.layer.shadowColor = UIColor.black.cgColor
    login.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    login.layer.shadowRadius = 8
    login.layer.shadowOpacity = 0.5
    login.layer.masksToBounds = false
    
    signUp.layer.shadowColor = UIColor.black.cgColor
    signUp.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    signUp.layer.shadowRadius = 8
    signUp.layer.shadowOpacity = 0.5
    signUp.layer.masksToBounds = false

  }
  
  
}


extension EmployeeCell {
  
  
  func conerReduis(){
      nameLabel.layer.cornerRadius = 15
      nameLabel.layer.borderWidth = 1
      nameLabel.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor
      idLabel.layer.cornerRadius = 15
      idLabel.layer.borderWidth = 1
      idLabel.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor
      
      rateBtn.layer.cornerRadius = 15
      rateBtn.layer.borderWidth = 1
      rateBtn.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor

      taskBtn.layer.cornerRadius = 15
      taskBtn.layer.borderWidth = 1
      taskBtn.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor

}
  
  func shadow(){
      taskBtn.layer.shadowColor = UIColor.black.cgColor
      taskBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
      taskBtn.layer.shadowRadius = 8
      taskBtn.layer.shadowOpacity = 0.5
      taskBtn.layer.masksToBounds = false
      
      
      rateBtn.layer.shadowColor = UIColor.black.cgColor
      rateBtn.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
      rateBtn.layer.shadowRadius = 8
      rateBtn.layer.shadowOpacity = 0.5
      rateBtn.layer.masksToBounds = false
     
  }
}
  
extension EvaluationCell {
  
  func conerReduis(){
      evaluationLabel.layer.cornerRadius = 15
      evaluationLabel.layer.borderWidth = 1
      evaluationLabel.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor
  }

  
}

extension TaskCell {
  func conerReduis(){
    nameLabel.layer.cornerRadius = 15
    nameLabel.layer.borderWidth = 1
    nameLabel.layer.borderColor =  UIColor(red:255/255, green:255/255, blue:255/255, alpha: 100).cgColor
  }
}
