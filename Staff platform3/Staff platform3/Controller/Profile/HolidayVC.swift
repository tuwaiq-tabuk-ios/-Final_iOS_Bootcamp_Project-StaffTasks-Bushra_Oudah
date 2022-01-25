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
  @IBOutlet weak var timeOfVicationTF: UITextField!
  @IBOutlet weak var holidayLab:UILabel!
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    addDateBtn.cmShadow()
    readHoliday()
  }
  
  
  // MARK: - Methods
  
  @IBAction func datePickerPressed(_ sender: Any) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.short
    let strDate = dateFormatter.string(from: datePicker.date)
    displayDateLabel.text = strDate
  }
  
  
  @IBAction func addDatePressed(_ sender: UIButton) {
    let washingtonRef =
    db.collection("Users").document(Auth.auth().currentUser!.uid)
    washingtonRef.updateData([
      "holiday": displayDateLabel.text,
      "timeOfVication":timeOfVicationTF.text
    ]) { err in
      if let err = err {
        print("Error updating document: \(err)")
      } else {
        print("Document successfully updated")
      }
    }
  }
  func readHoliday(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Users").document(user)
      
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          self.holidayLab.text = document.data()?["holiday"] as? String
        
          _ = Employee(name: nil,
                       email: nil,
                       phone: nil,
                       idNumber: nil,
                       task: nil,
                       evaluation: nil,
                       resignation: nil,
                       holiday: self.holidayLab.text ?? "لا يوجد اجازة ",active: nil,user:nil,zoomURL: nil, payroll: nil, timeOfVication: nil)
          
          print("Document data")
        } else {
          print("Document does not exist\(error?.localizedDescription)")
        }
      }
      
    }
  }
}

