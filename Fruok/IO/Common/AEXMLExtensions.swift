//
//  AEXMLExtensions.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/30/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML

extension AEXMLElement {
    
    func firstTag(withName name: String) -> AEXMLElement? {
        let matchingTags = children.filter { (element) -> Bool in
            return element.name == name
        }
        
        if matchingTags.count > 1 {
            print("Found more than 1 tags with given tag name \(name): \(matchingTags.count)")
        }
        
        return matchingTags.first
    }
    
}
