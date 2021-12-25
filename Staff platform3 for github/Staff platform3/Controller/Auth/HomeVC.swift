//
//  HomeVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit


class HomeVC: UIViewController {
  
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var bossButton: UIButton!
  @IBOutlet weak var employeeButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    shadow()
    conerReduis()
    
  }
  
}

