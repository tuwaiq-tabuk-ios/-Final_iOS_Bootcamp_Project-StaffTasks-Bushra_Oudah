//
//  SignUpEmpVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 17/05/1443 AH.
//

import UIKit

class SignUpEmpVC: UIViewController {

  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var nameTF: MainTF!
  @IBOutlet weak var emaiTF: MainTF!
  @IBOutlet weak var mobileTF: MainTF!
  @IBOutlet weak var idTF: MainTF!
  @IBOutlet weak var passwordTF: MainTF!
  @IBOutlet weak var SignUpBtn: UIButton!
  @IBOutlet weak var LoginBtn: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    conerReduis()
    shadow()
    }
    

}
