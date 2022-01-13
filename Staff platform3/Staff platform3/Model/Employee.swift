//
//  Employee.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore


  struct Employee: Codable , Identifiable {
       
      
  @DocumentID var id : String?  = UUID().uuidString
     var name:String?
    let email:String?
    var phone:String?
    let idNumber:String?
    let task:String?
    let evaluation:String?
    let resignation:String?
    let holiday:String?
    let active:String?
    let user: DocumentReference?
    let zoomURL:String?
  }
