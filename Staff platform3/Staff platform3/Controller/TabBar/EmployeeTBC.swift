import UIKit

class EmployeeTBC: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
extension EmployeeTBC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
