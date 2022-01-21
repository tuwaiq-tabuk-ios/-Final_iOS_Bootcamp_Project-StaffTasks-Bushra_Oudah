//
//  SettingVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit
import Firebase
import PDFKit
import FirebaseFirestore
import WebKit
class SettingEmpVC: UIViewController,WKUIDelegate,AlertsPresenting{
  
  // MARK: - Properties
  
  var webView: WKWebView!
  var pdfView = PDFView()
  var pdfURL: URL!
  let db = Firestore.firestore()
  let storage = Storage.storage()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var updateEmailBtn: UIButton!
  @IBOutlet weak var updateMobileBtn: UIButton!
  @IBOutlet weak var payrollBtn: UIButton!
  @IBOutlet weak var holidayBtn: UIButton!
  @IBOutlet weak var ZoomBtn: UIButton!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
   
    updatePassBtn.cmShadow()
    updateEmailBtn.cmShadow()
    updateMobileBtn.cmShadow()
    payrollBtn.cmShadow()
    holidayBtn.cmShadow()
    ZoomBtn.cmShadow()
    
  }
  // MARK: - IBAction
  
  
  @IBAction func signOutPressed(_ sender: UIBarButtonItem) {   let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      let vc = HomeVC.instantiate()
      self.navigationController?.pushViewController(vc, animated: true)
      print("signOut")
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
  
  
  @IBAction func payrollPressed(_ sender: UIButton) {
    if  let user = Auth.auth().currentUser?.uid{
              let docRef = db.collection("Users").document(user)
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
                                          holiday: nil,active: nil,user:nil,zoomURL: nil, payroll: payroll)
               
                             print("Document data")
                guard let url = URL(string:payroll ?? "\(self.showAlert(title: "Error", message: "There is no salary for the employee "))")
                  else { return }
                            let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())

                            let downloadTask = urlSession.downloadTask(with: url)
                            downloadTask.resume()
                  self.showAlert(title: "DO", message: "The Payroll PDF Downloaded")
                } else {
                  print("Document does not exist\(error?.localizedDescription)")
                }
              }

            }

        }
  
  @IBAction func zoomURLPressed(_ sender: UIButton) {
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      docRef.getDocument { [self] (document, error) in
        if let document = document, document.exists {
          if let error = error {
            print(error.localizedDescription)
            return
          }
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          let zoomURL = document.data()?["zoomURL"] as? String
          let webConfiguration = WKWebViewConfiguration()
          self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
          self.webView.uiDelegate = self
          view = webView
          if let myURL = URL(string:zoomURL ?? "\(self.showAlert(title: "Oops!", message: "The Boss hasn't sent you the link yet "))"){
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
          }

            print(zoomURL)
            let emp  = Employee(name:nil,
                                email: nil,
                                phone: nil,
                                idNumber: nil,
                                task: nil,
                                evaluation: nil,
                                resignation: nil,
                                holiday: nil,active: nil,user:nil,zoomURL: zoomURL, payroll: nil)
            print("Document data")
          }else{
            print("Document does not exist\(error?.localizedDescription)")
          }
        }
      }
    }
}

// MARK: - Navigation

extension SettingEmpVC:  URLSessionDownloadDelegate {
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

