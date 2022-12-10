//
//  MedicineTableViewCell.swift
//  MedAlert
//
//  Created by Student on 10/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {

    @IBOutlet weak var medicineNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
