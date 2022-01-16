import UIKit

class EmployeeTBC: UITabBarController {
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  
  // MARK: - Navigation
  
}
extension EmployeeTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
