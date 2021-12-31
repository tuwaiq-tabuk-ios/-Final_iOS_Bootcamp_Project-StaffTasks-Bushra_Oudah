


import UIKit
import Firebase
import PDFKit

class EmployeeTabelVC: UITableViewController {
  
 
  @IBOutlet var tabelView: UITableView!
  let db = Firestore.firestore()
  var employee = [Employee]()
    var pdfView = PDFView()
    var pdfURL: URL!

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
           print("doc.documentID\(doc.documentID)")
          let name = doc.data()["name"] as? String
          let id = doc.data()["id"] as? String
          let employees = Employee(name: name, email: nil, phone: nil, id: id,task: nil,evaluation: nil, resignation: nil)
          self.employee.append(employees)
          self.tableView.reloadData()
        }
      }
      self.tableView.reloadData()
    }
  }
    
    func saveEmployee(_ employee: Employee) {
      let docData: [String: Any] = [
        "task": employee.task,
        "evaluation": employee.evaluation,
      ]
 
      
        db.collection("Users").document("").setData(docData) { err in
        if let err = err {
          print("Error writing document: \(err)")
        } else {
          print("Document successfully written!")
        }
      }
    }
  @IBAction func addTask(_ sender: Any) {
      let alert = UIAlertController(title: "Task", message: "Enter Task ", preferredStyle: .alert)
      alert.addTextField { textField in
          textField.placeholder = "Enter Task"
      }
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {  [weak alert] (_) in
          let textField = alert?.textFields![0]
          print("Text field: \(textField!.text)")
      }))
      self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func addEvalution(_ sender: Any) {
      let alert = UIAlertController(title: "Evalution", message: "Enter Evalution ", preferredStyle: .alert)
      alert.addTextField { textField in
          textField.placeholder = "Enter Evalution"
      }
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {  [weak alert] (_) in
          let textField = alert?.textFields![0]
          print("Text field: \(textField!.text)")
      }))
      self.present(alert, animated: true, completion: nil)
      
  }
  
  @IBAction func addCerticate(_ sender: UIButton) {
      let alert = UIAlertController(title: "Certicate", message: "Enter Certicate ", preferredStyle: .alert)
      alert.addTextField { textField in
          textField.placeholder = "Enter Certicate"
      }
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {  [weak alert] (_) in
          let textField = alert?.textFields![0]
          print("Text field: \(textField!.text)")
      }))
      self.present(alert, animated: true, completion: nil)
  }
  
  
  @IBAction func downloadPDF(_ sender: Any) {
      guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }

              let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())

              let downloadTask = urlSession.downloadTask(with: url)
              downloadTask.resume()
  }
  
  @IBAction func openPDF(_ sender: UIButton) {
      let pdfViewController = PDFViewController()
      pdfViewController.pdfURL = self.pdfURL
      present(pdfViewController, animated: false, completion: nil)

  }

  }

extension EmployeeTabelVC:  URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
     print("downloadLocation:", location)
// create destination URL with the original pdf name
    guard let url = downloadTask.originalRequest?.url else { return }
     let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
      let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
//     delete original copy
     try? FileManager.default.removeItem(at: destinationURL)
//      copy from temp to Document
     do {
         try FileManager.default.copyItem(at: location, to: destinationURL)
         self.pdfURL = destinationURL
     } catch let error {
          print("Copy Error: \(error.localizedDescription)")
     }
 }
}
