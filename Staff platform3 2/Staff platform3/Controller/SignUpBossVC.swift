//
//  ViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit

class SignUpBossVC: UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: MainTF!
  @IBOutlet weak var emailTF: MainTF!
  @IBOutlet weak var mobileTF: MainTF!
  @IBOutlet weak var idTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  
  @IBOutlet weak var SignUp: UIButton!
  
  @IBOutlet weak var Login: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cornerRadios()
    shadow()
  }


}

