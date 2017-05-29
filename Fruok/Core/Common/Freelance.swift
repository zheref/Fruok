//
//  Freelance.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/30/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

public struct Freelance {
    
    let name: String
    let title: String
    let email: String
    
    var billingDetails: String?
    
    init(name: String, title: String, email: String) {
        self.name = name
        self.title = title
        self.email = email
    }
    
}
