//
//  SettingVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit



class SettingVC: UIViewController{
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var languageBtn: UIButton!
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var updateEmail: UIButton!
  @IBOutlet weak var updateMobile: UIButton!
  @IBOutlet weak var signOut: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    conerReduis()
    shadow()
  }
  

  
}

