//
//  EmployeeDetailsVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 15/06/1443 AH.
//

import UIKit
import Firebase
import PDFKit
import FirebaseFirestoreSwift
import FirebaseFirestore
import WebKit

class EmployeeDetailsVC: UIViewController,WKUIDelegate,UINavigationControllerDelegate,AlertsPresenting {
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employees = [Employee]()
  var employee: Employee?
  var employeeTask: Task?
  var employeeEvalution: Evaluation?
  var image:UIImage? = nil
  var pdfURL: URL!
  var webView: WKWebView!
  let pdfView = PDFView()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addTasksBtn: UIButton!
  @IBOutlet weak var addEvalutionBtn: UIButton!
  @IBOutlet weak var openPayrollBtn: UIButton!
  @IBOutlet weak var downloadPayrollBtn: UIButton!
  @IBOutlet weak var zoomBtn: UIButton!
  @IBOutlet weak var switchActive: UISwitch!
  @IBOutlet weak var activeInActiveLabel: UILabel!
  @IBOutlet weak var holidayLabel: UILabel!
  @IBOutlet weak var acceptanceBtn: UIButton!
  @IBOutlet weak var rejectBtn: UIButton!
  @IBOutlet weak var nameHolidayLabel: UILabel!
  @IBOutlet weak var timeOfVicationLabel: UILabel!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameLabel.text = employee?.name
    readHoliday()
    addTasksBtn.cmShadow()
    addEvalutionBtn.cmShadow()
    openPayrollBtn.cmShadow()
    downloadPayrollBtn.cmShadow()
    zoomBtn.cmShadow()
    acceptanceBtn.cmShadow( cornerRadius: 10, borderWidth: 10)
    rejectBtn.cmShadow(cornerRadius: 10, borderWidth: 10)
    
    
  }
  
  // MARK: - Methods
  
  func readHoliday(){
    let resignation = self.db.collection("Users").document((self.employee?.id)!)
    resignation.getDocument { (document, error) in
      if let document = document, document.exists {
        self.holidayLabel.text = document.data()?["holiday"] as? String
        self.timeOfVicationLabel.text = document.data()?["timeOfVication"] as? String
        _ = Employee.init(id: nil,
                          name: nil,
                          email: nil,
                          phone: nil,
                          idNumber: nil, task: nil, evaluation: nil, resignation: nil, holiday: self.holidayLabel.text, active: nil, user: nil, zoomURL: nil, payroll: nil, timeOfVication:  self.timeOfVicationLabel.text )
      }
    }
  }
  // MARK: - IBAction
  
  
  @IBAction func addTasksPressed(_ sender: Any) {
    let alert = UIAlertController(title: "Task",
                                  message: "Enter Task ",
                                  preferredStyle: .alert)
    
    
    alert.addTextField { textField in
      
      textField.placeholder = "Enter Task"
    }
    
    alert.addAction(UIAlertAction(title: "Ok",
                                  style: .default,
                                  handler: {  [weak alert] (_) in
      
      let textField = alert?.textFields![0]
      
      print(" - self.employee: \(String(describing: self.employee))")
      print(" - self.employee?.id: \(String(describing: self.employee?.id))")
      print(" - self.employee?.id: \(String(describing: self.employeeTask?.id))")
      let bookRef =
      self.db.collection("Task").document(UUID().uuidString)
      let task = textField!.text!
      print(" ------- Task: \(task)")
      bookRef.setData([
        "task": task,
        "UserRef":self.employee?.id
      ]) { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Error", message: err.localizedDescription)
        } else {
          print("Document successfully updated")
          self.showAlert(title: "succeeded", message: "The Task has been added")
        }
        print("Text field: \(textField!.text)")
      }
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  
  
  @IBAction func addEvalutionPressed(_ sender: Any) {
    let alert = UIAlertController(title: "Evalution",
                                  message: "Enter Evalution ",
                                  preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Enter Evalution"
    }
    alert.addAction(UIAlertAction(title: "Ok",
                                  style: .default,
                                  handler: {  [weak alert] (_) in
      let textField = alert?.textFields![0]
      print(" - self.employee: \(String(describing: self.employee))")
      print(" - self.employee?.id: \(String(describing: self.employee?.id))")
      print(" - self.employee?.id: \(String(describing: self.employeeEvalution?.id))")
      let bookRef = self.db.collection("Evalution").document(UUID().uuidString)
      let evaluation = textField!.text!
      print(" ------- evaluation: \(evaluation)")
      bookRef.setData([
        "evaluation": evaluation,
        "UserRef" :self.employee?.id
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Error", message: err.localizedDescription)
        } else {
          print("Document successfully updated")
          self.showAlert(title: "succeeded", message: "The Evalution has been added")
        }
        print("Text field: \(textField!.text)")
      }
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  
  @IBAction func openPayrollPressed(_ sender: Any) {
    let pdfViewController = PDFViewController()
    pdfViewController.pdfURL = self.pdfURL
    present(pdfViewController,
            animated: false,
            completion: nil)
  }
  
  
  @IBAction func downloadPayrollPressed(_ sender: Any) {
    let docRef = db.collection("Users").document((self.employee?.id)!)
    docRef.getDocument { (document, error) in
      if let document = document, document.exists {
        let payroll = document.data()?["payroll"] as? String
        _ = Employee(name: nil,
                     email: nil,
                     phone: nil,
                     idNumber: nil,
                     task: nil,
                     evaluation: nil,
                     resignation: nil,
                     holiday: nil,active: nil,user:nil,zoomURL: nil, payroll: payroll, timeOfVication: nil)
        print("Document data")
        
        guard let myURL = URL(string:payroll ?? "\(self.showAlert(title: "Done", message: "The payroll downloaded "))")
        else { return }
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let downloadTask = urlSession.downloadTask(with: myURL)
        downloadTask.resume()
        self.showAlert(title: "succeeded", message: "File downloaded")
      } else {
        print("Document does not exist\(error?.localizedDescription)")
        self.showAlert(title: "Error", message: error?.localizedDescription)
      }
    }
  }
  
  
  @IBAction func zoomPressed(_ sender: Any) {
    let alert = UIAlertController(title: "Zoom",
                                  message: "Enter URL Zoom ",
                                  preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Enter URL Zoom"
    }
    alert.addAction(UIAlertAction(title: "Ok",
                                  style: .default,
                                  handler: {  [weak alert] (_) in
      let textField = alert?.textFields![0]
      print("Text field: \(textField!.text)")
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "zoomURL":textField!.text
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Error", message: err.localizedDescription)
        } else {
          print("Document successfully updated")
          self.showAlert(title: "succeeded", message: "The Zoom URL has been added")
        }
        print("Text field: \(textField!.text)")
      }
      
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  
  @IBAction func switchActivePressed(_ sender: Any) {
    if switchActive.isOn{
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "active":"active "
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Error", message: err.localizedDescription)
          
        }else{
          print("Document successfully updated")
          self.showAlert(title: "succeeded", message: "The Employee has been active")
        }
      }
      switchActive.setOn(true, animated: true)
    }else{
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "active":"Un active "
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Error", message: err.localizedDescription)
        }else{
          print("Document successfully updated")
          self.showAlert(title: "succeeded", message: "The Employee has been Un active")
        }
      }
      switchActive.setOn(false, animated: true)
    }
  }
  
  
  @IBAction func acceptPressed(_ sender: Any) {
    self.showAlert(title: "succeeded", message: "Vacation is  accepted")
    
  }
  
  
  @IBAction func rejectPreesed(_ sender: Any) {
    db.collection("Users").document((self.employee?.id)!).updateData([
      "holiday": FieldValue.delete(),
      "timeOfVication":FieldValue.delete()]) { err in
        if let err = err {
          print("Error updating document: \(err)")
          self.showAlert(title: "Er", message: err.localizedDescription)
        } else {
          self.showAlert(title: "succeeded", message: "Vacation is not accepted")
          print("Document successfully updated")
        }
      }
  }
}


//     MARK: - Navigation

extension EmployeeDetailsVC:  URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    print("downloadLocation:", location)
    //        create destination URL with the original pdf name
    guard let url = downloadTask.originalRequest?.url else { return }
    let documentsPath = FileManager.default.urls(
      for: .cachesDirectory,
         in: .userDomainMask)[0]
    let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
    //            delete original copy
    try? FileManager.default.removeItem(at: destinationURL)
    do {
      try FileManager.default.copyItem(at: location,
                                       to: destinationURL)
      self.pdfURL = destinationURL
    } catch let error {
      print("Copy Error: \(error.localizedDescription)")
    }
  }
}


