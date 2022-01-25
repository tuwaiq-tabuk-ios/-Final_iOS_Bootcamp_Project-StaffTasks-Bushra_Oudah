//
//  Evaluation.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/06/1443 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Evaluation : Codable,Identifiable{
  @DocumentID var id : String?  = UUID().uuidString
  let evaluation: String?
  let user: DocumentReference?

}
