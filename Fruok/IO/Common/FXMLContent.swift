//
//  FXMLDocument.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/30/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import AEXML

class FXMLContent : AEXMLDocument {
    
    // MARK: - PROPERTIES
    
    var project: Project?
    
    
    // MARK: - METHODS
    
    
    private func clear() {
        for element in children {
            element.removeFromParent()
        }
    }
    
    
    func updateXML() {
        clear()
        
        if let project = project {
            addChild(project.xmlElementEquivalent)
        }
    
    }
    
}
