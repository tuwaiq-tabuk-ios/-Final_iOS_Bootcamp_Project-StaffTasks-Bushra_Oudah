import UIKit

class EmployeeTBC: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  
}
extension EmployeeTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
