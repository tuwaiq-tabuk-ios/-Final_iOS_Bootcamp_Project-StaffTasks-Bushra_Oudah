//
//  SettingVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit
import Firebase
import PDFKit

class SettingVC: UIViewController{
  
  @IBOutlet weak var imageLog: UIImageView!
  @IBOutlet weak var resignation: UIButton!
  @IBOutlet weak var updatePassBtn: UIButton!
  @IBOutlet weak var updateEmail: UIButton!
  @IBOutlet weak var updateMobile: UIButton!
  @IBOutlet weak var payroll: UIButton!
  
  @IBOutlet weak var holiday: UIButton!
  var pdfView = PDFView()
  var pdfURL: URL!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    resignation.cmShadow()
    updatePassBtn.cmShadow()
    updateEmail.cmShadow()
    updateMobile.cmShadow()
    payroll.cmShadow()
    holiday.cmShadow()
    
  }
  
  
  
  @IBAction func signOutPressed(_ sender: UIBarButtonItem) { let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      self.navigationController?.popToRootViewController(animated: true)
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

