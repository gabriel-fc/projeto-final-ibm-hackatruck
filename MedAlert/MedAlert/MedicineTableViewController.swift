//
//  MedicineTableViewController.swift
//  MedAlert
//
//  Created by Student on 10/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController {

    var medicines = [Medicine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Entra aqui1")
        //medicineList = MedicineDAO.getList()
        downloadJSON {
            self.tableView.reloadData()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicines.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicine", for: indexPath)
        
        
        if let medicineCell = cell as? MedicineTableViewCell{
            let medicine = medicines[indexPath.row]
            
            medicineCell.medicineNameLabel.text = medicine.medicineName!
            
            return medicineCell
        }
        // Configure the cell...

        return cell
    }
 
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func downloadJSON(completed: @escaping () -> ()){
    let url = URL(string: "http://127.0.0.1:1880/medicines")
    URLSession.shared.dataTask(with: url!) {
        data, response, err in
        if err == nil{
            do {
                let dados = try JSONDecoder().decode(getMedicines.self, from: data!)
                self.medicines = dados.medicines
                //self.timestamp = self.brFormatDateFrom(timestamp: dados.timestamp!)
             print(self.medicines[0].medicineName!)
                DispatchQueue.main.async {
                    completed()
                }
            }
            catch{
                print(err!)
            }
        }
    }.resume()
    }
    
    

}
