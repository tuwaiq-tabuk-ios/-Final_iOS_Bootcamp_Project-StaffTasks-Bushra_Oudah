//
//  viewControllerViewController.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 30/05/1443 AH.
//

import UIKit

class ViewController: UINavigationController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

// MARK: - Navigation

extension ViewController :Storyboarded{
  static var storyboardName: StoryboardName = .main
}
