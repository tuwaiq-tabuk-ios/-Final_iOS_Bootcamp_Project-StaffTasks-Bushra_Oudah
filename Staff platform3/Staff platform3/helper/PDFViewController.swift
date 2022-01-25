import Foundation
import UIKit
import PDFKit

class PDFViewController: UIViewController {
  
  var pdfView = PDFView()
  var pdfURL: URL!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pdfURL = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf")
    
    view.addSubview(pdfView)
    
    if let document = PDFDocument(url: pdfURL!) {
      pdfView.document = document
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  override func viewDidLayoutSubviews() {
    pdfView.frame = view.frame
  }
}
