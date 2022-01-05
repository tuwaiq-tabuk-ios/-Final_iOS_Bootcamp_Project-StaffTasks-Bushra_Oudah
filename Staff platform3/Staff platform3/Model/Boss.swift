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

struct Boos:Codable {
  @DocumentID var documentID : String? = ""
    let name:String?
    let phone:String?
    let email:String?
    let id:String?
//  let user:DocumentReference
    
}

