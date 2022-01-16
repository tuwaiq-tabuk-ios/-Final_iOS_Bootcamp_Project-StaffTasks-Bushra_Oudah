//
//  Holiday.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 30/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class HolidayVC: UIViewController {
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var imageLogo: UIImageView!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var displayDateLabel: UILabel!
  @IBOutlet weak var addDateBtn: UIButton!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    addDateBtn.cmShadow()
  }
  
  
  // MARK: - Methods
  
  @IBAction func datePickerPressed(_ sender: Any) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.short
    //     dateFormatter.timeStyle = DateFormatter.Style.short
    let strDate = dateFormatter.string(from: datePicker.date)
    displayDateLabel.text = strDate
  }
  
  
  @IBAction func addDatePressed(_ sender: UIButton) {
    let washingtonRef = db.collection("Users").document(Auth.auth().currentUser!.uid)
    washingtonRef.updateData([
      "holiday": displayDateLabel.text!
    ]) { err in
      if let err = err {
        print("Error updating document: \(err)")
      } else {
        print("Document successfully updated")
      }
    }
    let alert1 = UIAlertController(title: "succeeded", message: "The Date has been sent", preferredStyle: UIAlertControllerStyle.alert)
                alert1.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
  }
}

