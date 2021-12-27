


import UIKit
import Firebase

class EmployeeTabelVC: UITableViewController {
  
 
  @IBOutlet var tabelView: UITableView!
  let db = Firestore.firestore()
  var employee = [Employee]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readProvider()
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employee.count
    
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as! EmployeeCell
     cell.nameLabel.text = employee[indexPath.row].name
    cell.idLabel.text = employee[indexPath.row].id
    return cell
    
  }
  func readProvider(){
    db.collection("Users").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("Error fetching documents: \(error!)")
        return
      }
      for doc in documents{
        if (doc.data()["userType"] as? String == UserType.EMPLOYEE.rawValue) {
          let name = doc.data()["name"] as? String
          let id = doc.data()["id"] as? String
          let employees = Employee(name: name, email: nil, phone: nil, id: id,task: nil,evaluation: nil)
          self.employee.append(employees)
          self.tableView.reloadData()
        }
      }
      self.tableView.reloadData()
    }
  }
  
}
