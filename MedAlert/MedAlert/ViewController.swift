//
//  ViewController.swift
//  MedAlert
//
//  Created by Student on 10/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var dateInput: UIDatePicker!
    @IBOutlet weak var timeInput: UIDatePicker!
    @IBAction func refreshButton(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "BRT")
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd/MM/yyyy"
        let str = formatter.string(from: dateInput.date)
        print(str)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //homeLabel.text =
        // Do any additional setup after loading the view.
    }
    
    
    
     
    }


