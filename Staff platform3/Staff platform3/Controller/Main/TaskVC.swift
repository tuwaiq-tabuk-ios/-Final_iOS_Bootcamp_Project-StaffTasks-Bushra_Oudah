import UIKit
import Firebase
import FirebaseFirestore

class TaskVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  @IBOutlet weak var tabelView: UITableView!
  
  let db = Firestore.firestore()
  var employee = [Employee]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readTask()
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employee.count
    
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
    cell.nameLabel.text = employee[indexPath.row].task
    return cell
  }
  
  func readTask(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          if let error = error {
            print(error.localizedDescription)
            return
          }
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          let task = document.data()?["task"] as? String
          print(task)
          let emp  = Employee(name:nil,
                              email: nil,
                              phone: nil,
                              id: nil,
                              task: task,
                              evaluation: nil,
                              resignation: nil,
                              holiday: nil)
          
          self.employee.append(emp)
          print("Document data")
          self.tabelView.reloadData()
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
    }
  }
  
  
  
}
