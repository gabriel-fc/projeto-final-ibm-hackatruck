//
//  getAppointments.swift
//  MedAlert
//
//  Created by Student on 14/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation


struct getAppointments: Codable{
    let appointments: [Appointment]
    let id: String?
    let rev: String?
    
}
