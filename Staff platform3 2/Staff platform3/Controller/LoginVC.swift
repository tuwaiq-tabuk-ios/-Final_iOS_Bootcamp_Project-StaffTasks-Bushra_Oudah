//
//  LoginVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit

class LoginVC: UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var emailTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  @IBOutlet weak var login: UIButton!
  @IBOutlet weak var signUp: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    shadow()
    conerReduis()
    }
    


}
