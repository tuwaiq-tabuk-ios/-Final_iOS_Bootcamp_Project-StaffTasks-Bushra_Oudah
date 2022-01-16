import UIKit

class BossTBC: UITabBarController {
  
  // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
      overrideUserInterfaceStyle = .light
        navigationItem.setHidesBackButton(true, animated: true)
    }
    

  // MARK: - Navigation
  
}
extension BossTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
