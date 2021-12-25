//
//  EditeMobileVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit


class EditeMobileVC : UIViewController {
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var newMobileTF: MainTF!
  @IBOutlet weak var saveBtn: UIButton!
  
  
  override func viewDidLoad() {
      super.viewDidLoad()
      conerReduis()
    shadow()
  }
  
  
}
