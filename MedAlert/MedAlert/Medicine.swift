//
//  MedicineReminder.swift
//  MedAlert
//
//  Created by Student on 10/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation


class Medicine {
    let medicineName: String
    
    init(medicineName: String) {
        self.medicineName = medicineName
    }
}
class MedicineDAO{
    
    static func getList() -> [Medicine]{
        return [
        Medicine(medicineName: "Dorflex"), Medicine(medicineName: "Paracetamol"), Medicine(medicineName: "Cimegripe")
        ]
    }
}
