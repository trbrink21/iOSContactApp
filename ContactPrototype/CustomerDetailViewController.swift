//
//  CustomerDetailViewController.swift
//  ContactPrototype
//
//  Created by Tyler Brink on 12/3/16.
//  Copyright © 2016 Tyler Brink. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var custFirstName: String = ""
    var custLastName: String = ""
    var custEmail: String = ""
    var custAddress: String = ""
    var custCity: String = ""
    var custState: String = ""
    var custZip: Int = 0
    
    var SelectedCustomer: Customer?
    var IndexPath: IndexPath = []
    
    override func viewDidLoad() {
        //Load data for existing customers
        if let customers = SelectedCustomer {
            navigationItem.title = customers.firstName + " Options"
            custFirstName = customers.firstName
            custLastName = customers.lastName
            custEmail = customers.email
            custAddress = customers.address
            custCity = customers.city
            custState = customers.state
            custZip = customers.zip
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditCustomer" {
            let customerDetailViewController = segue.destination as! newCustomerViewController
          
            customerDetailViewController.newCustomer = SelectedCustomer
            customerDetailViewController.IndexPath = IndexPath
            customerDetailViewController.editCust = 1
            
        }
        else if segue.identifier == "EditPics" {
            let customerDetailViewController = segue.destination as! CustomerPicCollectionViewController
            
            customerDetailViewController.selectedCustomer = SelectedCustomer
            customerDetailViewController.IndexPath = IndexPath
        }
        else if segue.identifier == "AddItem" {
            print("adding new customer")
        }
        
    }

}
