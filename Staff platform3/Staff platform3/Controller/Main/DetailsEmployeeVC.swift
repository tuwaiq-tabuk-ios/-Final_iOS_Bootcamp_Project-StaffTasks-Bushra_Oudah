//
//  DetailsTabelEmployeeVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 02/06/1443 AH.
//

import UIKit
import Firebase
import PDFKit
import FirebaseFirestoreSwift
import FirebaseFirestore
import WebKit

class DetailsEmployeeVC: UIViewController, WKUIDelegate,UINavigationControllerDelegate{
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var employees = [Employee]()
  var employee: Employee?
  var image:UIImage? = nil
  var pdfView = PDFView()
  var pdfURL: URL!
  var webView: WKWebView!
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageCleact: UIImageView!
  @IBOutlet weak var zoomBtn: UIButton!
  @IBOutlet weak var dowlondPayrollBtn: UIButton!
  @IBOutlet weak var openPayrollBtn: UIButton!
  @IBOutlet weak var addEvaluationBtn: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addTasksBtn: UIButton!
  @IBOutlet weak var activeInactiveLabel: UILabel!
  @IBOutlet weak var activeSwitch: UISwitch!
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    zoomBtn.cmShadow()
    openPayrollBtn.cmShadow()
    dowlondPayrollBtn.cmShadow()
    addTasksBtn.cmShadow()
    addEvaluationBtn.cmShadow()
    nameLabel.text = employee?.name
  }
  
  
  // MARK: - Methods
  
  
  @IBAction func addTask(_ sender: Any) {
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
      let bookRef =
      self.db.collection("Users")
        .document((self.employee?.id)!)
      let task = textField!.text!
      print(" ------- Task: \(task)")
      bookRef.updateData([
        "task": task
      ]) { err in
        if let err = err {
          print("Error updating document: \(err)")
        } else {
          print("Document successfully updated")
        }
        print("Text field: \(textField!.text)")
      }
      let alert1 = UIAlertController(title: "succeeded", message: "The Task has been added", preferredStyle: UIAlertControllerStyle.alert)
                  alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                  self.present(alert1, animated: true, completion: nil)
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  
  @IBAction func addEvalution(_ sender: Any) {
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
      print("Text field: \(textField!.text)")
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "evaluation":textField!.text
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
        } else {
          print("Document successfully updated")
        }
        print("Text field: \(textField!.text)")
      }
      
      let alert1 = UIAlertController(title: "succeeded", message: "The Evalution has been added", preferredStyle: UIAlertControllerStyle.alert)
                  alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                  self.present(alert1, animated: true, completion: nil)
      
    }))
    
    self.present(alert, animated: true, completion: nil)
  }
  
  
  @IBAction func activeSwitchPressed(_ sender: Any) {
    if activeSwitch.isOn{
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "active":"active "
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
        }else{
          print("Document successfully updated")
        }
      }
      activeSwitch.setOn(true, animated: true)
      
      let alert = UIAlertController(title: "succeeded", message: "The Employee has been active ", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
      
    }else{
      let bookRef = self.db.collection("Users").document((self.employee?.id)!)
      bookRef.updateData([
        "active":"Un active "
      ])
      { err in
        if let err = err {
          print("Error updating document: \(err)")
        }else{
          print("Document successfully updated")
        }
      }
      activeSwitch.setOn(false, animated: true)
    }
    let alert = UIAlertController(title: "succeeded", message: "The Employee has been Un active ", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func downloadPDF(_ sender: Any) {
    guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }
    let urlSession = URLSession(configuration: .default,
                                delegate: self,
                                delegateQueue: OperationQueue())
    let downloadTask = urlSession.downloadTask(with: url)
    downloadTask.resume()
    
    let alert1 = UIAlertController(title: "succeeded", message: "File downloaded", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
  }
  
  
  @IBAction func openPDF(_ sender: UIButton) {
    let pdfViewController = PDFViewController()
    pdfViewController.pdfURL = self.pdfURL
    present(pdfViewController,
            animated: false,
            completion: nil)
    
  }
  
  
  @IBAction func zoom(_ sender: Any) {
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
        } else {
          print("Document successfully updated")
        }
        print("Text field: \(textField!.text)")
      }
      let alert1 = UIAlertController(title: "succeeded", message: "The link has been sent", preferredStyle: UIAlertControllerStyle.alert)
                  alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                  self.present(alert1, animated: true, completion: nil)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

// MARK: - Navigation

extension DetailsEmployeeVC:  URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    print("downloadLocation:", location)
    
    
    // create destination URL with the original pdf name
    guard let url = downloadTask.originalRequest?.url else { return }
    let documentsPath = FileManager.default.urls(
      for: .cachesDirectory,
      in: .userDomainMask)[0]
    let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
    
    
    //     delete original copy
    try? FileManager.default.removeItem(at: destinationURL)
    
    
    //      copy from temp to Document
    do {
      try FileManager.default.copyItem(at: location,
                                       to: destinationURL)
      self.pdfURL = destinationURL
    } catch let error {
      print("Copy Error: \(error.localizedDescription)")
    }
  }
}


