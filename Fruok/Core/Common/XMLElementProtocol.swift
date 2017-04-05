//
//  XMLElementProtocol.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML

protocol XMLElementProtocol {
    
    static var TagName: String { get }
    
    var xmlElementEquivalent: AEXMLElement { get }
    
}
