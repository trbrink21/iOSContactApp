//
//  Customer.swift
//  ContactPrototype
//
//  Created by Tyler Brink on 11/14/16.
//  Copyright © 2016 Tyler Brink. All rights reserved.
//

import UIKit


class Customer {
    var firstName: String
    var lastName: String
    var email: String
    var address: String
    var city: String
    var state: String
    var zip: Int
    var images = [UIImage?]()
    
    
    init?(firstName: String, lastName: String, email: String, address: String, city: String, state: String, zip: Int) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        
        //if (firstName.isEmpty || lastName.isEmpty) {
            //return nil
        //}
        
    }
    
    var customerRecords = [Customer]()
    
}
