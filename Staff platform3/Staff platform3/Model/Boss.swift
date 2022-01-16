//
//  Boss.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import UIKit



struct Boss:Codable {
  
  // MARK: - Properties
  
  @DocumentID var documentID : String? = ""
    var name:String?
    var phone:String?
    let email:String?
    let id:String?

    
}

