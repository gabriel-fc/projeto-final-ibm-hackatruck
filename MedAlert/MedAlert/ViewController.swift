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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        httpRequest {
            print("funcionou")
        }
        //homeLabel.text =
        // Do any additional setup after loading the view.
    }
    
    
    func httpRequest(completed: @escaping () -> ()){
        let url = URL(string: "http://127.0.0.1:1880/medicines")
        var request = URLRequest(url:url!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod="POST"
        let parameters: [String: Any] = [
            "id": 13,
            "name": "Jack & Jill"
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
             URLSession.shared.dataTask(with: request){
                 data, response, err in
                print("fora do if")
                if err == nil{
                     do{
                         print(response!)
                        DispatchQueue.main.async {
                            completed()
                        }
                     }
                    catch{
                        print("err")
                    }
                 }
               
                 
        }.resume()
    }
    


}

