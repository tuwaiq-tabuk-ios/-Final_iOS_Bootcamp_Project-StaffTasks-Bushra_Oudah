//
//  Employee.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Employee:Codable {
    @DocumentID var id : String? = ""
    let name:String?
    let email:String?
    let phone:String?
    let idNumber:String?
    let task:String?
    let evaluation:String?
    let resignation:String?
    let holiday:String?
    let active:String?
    let user: DocumentReference?
    
}

