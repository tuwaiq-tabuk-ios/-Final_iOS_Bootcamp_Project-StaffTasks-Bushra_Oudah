
import UIKit

class BoosTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
    }
    


}
extension BoosTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
