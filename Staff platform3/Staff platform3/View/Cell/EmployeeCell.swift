//
//  EmployeeCell.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 21/05/1443 AH.
//

import UIKit

class EmployeeCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var rateBtn: UIButton!
  @IBOutlet weak var taskBtn: UIButton!
  
  override func awakeFromNib() {
      super.awakeFromNib()
    rateBtn.cmShadow()
    taskBtn.cmShadow()
    rateBtn.cmShadow(cornerRadius: 15)
    taskBtn.cmShadow(cornerRadius: 15)
  }


  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

  }

}