//
//  viewControllerViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 30/05/1443 AH.
//

import UIKit

class ViewController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
}


extension ViewController :Storyboarded{
  static var storyboardName: StoryboardName = .main
}
