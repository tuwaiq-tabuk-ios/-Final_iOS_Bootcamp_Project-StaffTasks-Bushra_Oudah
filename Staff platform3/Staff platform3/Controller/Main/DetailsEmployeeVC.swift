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

class DetailsEmployeeVC: UIViewController, WKUIDelegate{
  let db = Firestore.firestore()
  var employees = [Employee]()
  var employee: Employee?
  
  var image:UIImage? = nil
  var pdfView = PDFView()
  var pdfURL: URL!
  var webView: WKWebView!
  
  @IBOutlet weak var imageCleact: UIImageView!
  
  @IBOutlet weak var zoom: UIButton!
  @IBOutlet weak var dowlondPayroll: UIButton!
  @IBOutlet weak var openPayroll: UIButton!
  @IBOutlet weak var addEvaluation: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addTasks: UIButton!
  
  @IBOutlet var active: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    zoom.cmShadow()
    openPayroll.cmShadow()
    dowlondPayroll.cmShadow()
    addTasks.cmShadow()
    addEvaluation.cmShadow()
    nameLabel.text = employee?.name
  }
  
  
  @IBAction func addTask(_ sender: Any) {
    print("\n\n----------------------------- \(#function)")
    
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
        
      }   }))
    
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
      }}))
    self.present(alert, animated: true, completion: nil)
    
    
    
    
  }
  @IBAction func active(_ sender: Any) {
    
    let bookRef = self.db.collection("Users").document((self.employee?.id)!)
    
    bookRef.updateData([
      "active":"Un active "
    ])
    { err in
      if let err = err {
        print("Error updating document: \(err)")
      } else {
        print("Document successfully updated")
        
      }

    }
  
}
  @IBAction func addCerticate(_ sender: UIButton) {
    setupImage()
  }
  
  func setupImage() {
    imageCleact.contentMode = .scaleAspectFit
    imageCleact.layer.borderWidth = 1
    imageCleact.layer.masksToBounds = false
    imageCleact.layer.borderColor = UIColor.black.cgColor
    imageCleact.layer.cornerRadius = imageCleact.frame.height/2
    imageCleact.clipsToBounds = true
    imageCleact.isUserInteractionEnabled = true
    let tabGesture = UITapGestureRecognizer(target: self, action: #selector(presntPicker))
    imageCleact.addGestureRecognizer(tabGesture)
  }
  
  @objc func presntPicker() {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    picker.delegate = self
    self.present(picker, animated: true, completion: nil)
  }
  
  @IBAction func downloadPDF(_ sender: Any) {
    guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }
    
    let urlSession = URLSession(configuration: .default,
                                delegate: self,
                                delegateQueue: OperationQueue())
    
    let downloadTask = urlSession.downloadTask(with: url)
    downloadTask.resume()
  }
  @IBAction func openPDF(_ sender: UIButton) {
    let pdfViewController = PDFViewController()
    pdfViewController.pdfURL = self.pdfURL
    present(pdfViewController,
            animated: false,
            completion: nil)
    
  }
  
  @IBAction func zoom(_ sender: Any) {
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    view = webView
    let myURL = URL(string:"https://zoom.us")
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
    
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
      }}))
    self.present(alert, animated: true, completion: nil)
  }
  
}
extension DetailsEmployeeVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  
  private func imagePickerController(_ picker: UIImagePickerController,
                                     didFinishPickingMediaWithInfo info: [String : Any]) {
    picker.dismiss(animated: true, completion: nil)
    guard let imageSelected = info[UIImagePickerControllerOriginalImage] as? UIImage else {
      return
    }
    image = imageSelected
    imageCleact.image = imageSelected
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}



extension DetailsEmployeeVC:  URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    
    print("downloadLocation:", location)
    
    // create destination URL with the original pdf name
    guard let url = downloadTask.originalRequest?.url else { return }
    let documentsPath = FileManager.default.urls(for: .cachesDirectory,
                                                    in: .userDomainMask)[0]
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


