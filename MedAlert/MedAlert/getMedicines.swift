//
//  getMedicines.swift
//  MedAlert
//
//  Created by Student on 14/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation


struct getMedicines: Codable{
    let medicines: [Medicine]
    let id: String?
    let rev: String?
}
