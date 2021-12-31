import UIKit

class EmployeeTBC: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  
}
extension EmployeeTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
