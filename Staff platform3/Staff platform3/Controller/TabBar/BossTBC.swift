import UIKit

class BossTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      overrideUserInterfaceStyle = .light
        navigationItem.setHidesBackButton(true, animated: true)
    }
    


}
extension BossTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
