//
//  EditeEmailVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//
import UIKit


class EditeEmailVC : UIViewController {
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var newEmailTF: MainTF!
  
  @IBOutlet weak var saveBotn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    conerReduis()
    shadow()
  }
  
  
}

