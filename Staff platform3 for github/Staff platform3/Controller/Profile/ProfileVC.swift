//
//  ProfileVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//


import UIKit



class ProfileVC: UIViewController {
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var PhoneLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    conerReduis()
  }
  
  
}
