import UIKit
import Firebase
import FirebaseFirestore

class TaskVC: UIViewController {
  
  // MARK: - Properties
  let db = Firestore.firestore()
  var task = [Task]()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var tabelView: UITableView!
  
  
  // MARK: - View controller lifecycle
 
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readTask()
    overrideUserInterfaceStyle = .light
    
  }
  
  // MARK: - Methods
  
  func readTask(){
    db
      .collection("Task")
      .addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("Error fetching documents: \(error!)")
          return
        }
        
        self.task = []
        
        for doc in documents {
          if (doc.data()["UserRef"] as? String == Auth.auth().currentUser?.uid) {
            print("doc.documentID\(doc.documentID)")
            let task = doc.data()["task"] as? String
            let tasks = Task.init(id: doc.documentID, task: task, user: nil)
            self.task.append(tasks)
            
          }
        }
        self.tabelView.reloadData()
      }
  }

}
  // MARK: - Table data source
  extension TaskVC: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return task.count
  }
  }
  
  // MARK: - Navigation

  extension TaskVC: UITableViewDelegate {
    
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
    cell.nameLabel.text = task[indexPath.row].task
    return cell
  }
}
