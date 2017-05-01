//
//  Client.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML

public struct Client : XMLElementProtocol {
    
    // MARK: - CLASS CONSTANTS
    
    static var TagName = "client"
    
    enum Attribute : String {
        case socialName
        case responsible
        case email
        case phoneNumber
    }
    
    // MARK: - STORED PROPERTIES
    
    public let name: String
    
    public var socialName: String?
    public var socialId: String?
    public var responsible: String?
    public var email: String?
    public var phoneNumber: String?
    
    // MARK: - COMPUTED PROPERTIES
    
    var xmlElementEquivalent: AEXMLElement {
        return XMLParser.unparse(client: self)
    }
    
}
