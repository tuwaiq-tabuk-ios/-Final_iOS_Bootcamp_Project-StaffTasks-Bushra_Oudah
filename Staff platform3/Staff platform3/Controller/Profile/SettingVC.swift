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
class SettingVC: UIViewController,WKUIDelegate{
  var webView: WKWebView!

  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var resignation: UIButton!
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var updateEmail: UIButton!
  @IBOutlet weak var updateMobile: UIButton!
  @IBOutlet weak var payroll: UIButton!
  
  @IBOutlet weak var holiday: UIButton!
  var pdfView = PDFView()
  var pdfURL: URL!
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    overrideUserInterfaceStyle = .light
    resignation.cmShadow()
    updatePassBtn.cmShadow()
    updateEmail.cmShadow()
    updateMobile.cmShadow()
    payroll.cmShadow()
    holiday.cmShadow()
    
  }
  
  
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
  
  @IBAction func payroll(_ sender: UIButton) {
    guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else { return }

            let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())

            let downloadTask = urlSession.downloadTask(with: url)
            downloadTask.resume()
  }
  
  
  @IBAction func zoomURL(_ sender: UIButton) {
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
              let myURL = URL(string:zoomURL!)
          let myRequest = URLRequest(url: myURL!)
              webView.load(myRequest)
          print(zoomURL)
        
          let emp  = Employee(name:nil,
                              email: nil,
                              phone: nil,
                              idNumber: nil,
                              task: nil,
                              evaluation: nil,
                              resignation: nil,
                              holiday: nil,active: nil,user:nil,zoomURL: zoomURL)
          
          print("Document data")
    
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
    }
  }
}
extension SettingVC:  URLSessionDownloadDelegate {
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

