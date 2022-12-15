//
//  AppointmentsTableViewController.swift
//  MedAlert
//
//  Created by Student on 13/12/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class AppointmentsTableViewController: UITableViewController {
    
    var appointments = [Appointment]()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return appointments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath)
        if let appointmentCell = cell as? AppointmentTableViewCell{
            let appointment = appointments[indexPath.row]
            appointmentCell.dateLabel.text = appointment.date!
            appointmentCell.docNameLabel.text = appointment.name!
            appointmentCell.hourLabel.text = appointment.time!
            appointmentCell.specialtyLabel.text = appointment.specialty!
            return appointmentCell
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
    let url = URL(string: "http://127.0.0.1:1880/appointments")
    URLSession.shared.dataTask(with: url!) {
        data, response, err in
        if err == nil{
            do {
                let dados = try JSONDecoder().decode(getAppointments.self, from: data!)
                self.appointments = dados.appointments
                //self.timestamp = self.brFormatDateFrom(timestamp: dados.timestamp!)
             print(self.appointments[0])
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
