//
//  newCustomerViewController.swift
//  ContactPrototype
//
//  Created by Tyler Brink on 11/7/16.
//  Copyright © 2016 Tyler Brink. All rights reserved.
//

import UIKit

class newCustomerViewController: UIViewController, UITextFieldDelegate {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //User input fields
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var zipText: UITextField!
    
    //var newCustomer = [Customer]()
    var newCustomer: Customer?
    var IndexPath: IndexPath? = []
    var editCust: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameText.delegate = self
        lastNameText.delegate = self
        emailText.delegate = self
        addressText.delegate = self
        cityText.delegate = self
        stateText.delegate = self
        zipText.delegate = self
        // Do any additional setup after loading the view.
        
        //Load data for existing customers
        if let customers = newCustomer {
            navigationItem.title = customers.firstName + " " + customers.lastName
            firstNameText.text = customers.firstName
            lastNameText.text = customers.lastName
            emailText.text = customers.email
            addressText.text = customers.address
            cityText.text = customers.city
            stateText.text = customers.state
            zipText.text = String(customers.zip)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Move focus to last name field
        if (textField == self.firstNameText) {
            self.lastNameText .becomeFirstResponder()
        }
        //Move focus to email field
        else if (textField == self.lastNameText) {
            self.emailText .becomeFirstResponder()
        }
        //Move focus to address field
        else if (textField == self.emailText) {
            self.addressText .becomeFirstResponder()
        }
        //Move focus to city field
        else if (textField == self.addressText) {
            self.cityText .becomeFirstResponder()
        }
        //Move focus to state field
        else if (textField == self.cityText) {
            self.stateText .becomeFirstResponder()
        }
        //Move focus to zip code field
        else if (textField == self.stateText) {
            self.zipText .becomeFirstResponder()
        }
        //Done - hide keyboard
        else if (textField == self.zipText){
            textField.resignFirstResponder()
        }
        return true
        
    }
    

    
    
    @IBAction func submitNewCustomer(_ sender: Any) {

        //Check to see if all text fields have a value
        if (firstNameText.text != "" && lastNameText.text != "" && emailText.text != "" && addressText.text != "" && cityText.text != "" && stateText.text != "" && zipText.text != "") {
            let newFirstName = firstNameText.text
            let newLastName = lastNameText.text
            let newEmail = emailText.text
            let newAddress = addressText.text
            let newCity = cityText.text
            let newState = stateText.text
            let newZip = Int(zipText.text!)
        
            //Editing existing customer
            if editCust == 1 {
                self.newCustomer = Customer(firstName: newFirstName!, lastName: newLastName!, email: newEmail!, address: newAddress!, city: newCity!, state: newState!, zip: newZip!)
                    customers[(IndexPath?.row)!] = newCustomer!
                    
                // create the alert
                let alert = UIAlertController(title: "Customer Updated", message: "You have successfully updated the customer.", preferredStyle: UIAlertControllerStyle.alert)
                    
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
                    //Send user back to customer list
                    self.performSegue(withIdentifier: "unwindToList", sender: self)
                }))
                    
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            //Creating new customer
            else {

                // create the alert
                let alert = UIAlertController(title: "Submit New Customer?", message: "Would you like to submit the new customer?", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
                    
                    //Setup data structure with user input values
                    self.newCustomer = Customer(firstName: newFirstName!, lastName: newLastName!, email: newEmail!, address: newAddress!, city: newCity!, state: newState!, zip: newZip!)
                    //Add new customer
                    customers.append(self.newCustomer!)
                    
                    //Send user back home
                    self.performSegue(withIdentifier: "unwindToHome", sender: self)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        //At least one text field is blank
        else {
            // create the alert
            let alert = UIAlertController(title: "Customer Information Incomplete", message: "Please make sure all fields have been entered.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //println("prepareForSegue");
    //}
    
    
    
}
