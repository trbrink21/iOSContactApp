//
//  CustomerTableViewController.swift
//  ContactPrototype
//
//  Created by Tyler Brink on 11/14/16.
//  Copyright © 2016 Tyler Brink. All rights reserved.
//

import UIKit

var customers = [Customer]()

class CustomerTableViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        //Sort the tableview by customer first name
        customers.sort {$0.firstName < $1.firstName}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CustomerTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomerTableViewCell
        
        let customer = customers[indexPath.row]
        
        cell.nameLabel.text = (customer.firstName ) + " "+customer.lastName
        
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            customers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toOptions" {
            let customerDetailViewController = segue.destination as! CustomerDetailViewController
            
            if let selectedCustomerCell = sender as? CustomerTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCustomerCell)!
                let selectedCustomer = customers[indexPath.row]
                customerDetailViewController.SelectedCustomer = selectedCustomer
                customerDetailViewController.IndexPath = indexPath
            }
        }
        else if segue.identifier == "AddItem" {
            print("adding new customer")
        }
        
    }
    
    @IBAction func unwindList(sender: UIStoryboardSegue) {
        
    }
    

}
