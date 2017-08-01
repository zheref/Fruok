//
//  FXMLDocument.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/30/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import AEXML

public class FXMLContent : AEXMLDocument {
    
    // MARK: - PROPERTIES
    
    /// The main Project instance stored in memory for the project handled by the host window
    var project: Project?
    
    // MARK: - INITIALIZERS
    
    
    static func from(xmlString: String) throws -> FXMLContent {
        let fxml = try FXMLContent(xml: xmlString)
        fxml.updateModelIfNeeded()
        return fxml
    }
    
    
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
    
    
    func updateModelIfNeeded() {
        if project == nil {
            project = Project.fromXML(root)
            print("Parsed project from XML:")
            print(project)
        }
    }
    
}
