//
//  Project.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML


public struct Project : XMLCompliantProtocol {
    
    // MARK: - CLASS CONSTANTS
    
    static var TagName: String = "project"
    
    static let NameAttrName = "name"
    static let DisplayNameAttrName = "displayName"
    static let DurationAttrName = "duration"
    static let DeadlineAttrName = "deadline"
    
    // MARK: - STORED PROPERTIES
    
    public let name: String
    
    public var displayName: String?
    public var duration: TimeInterval?
    public var deadline: Date?
    
    public var client: Client
    public var projectType: ProjectType
    
    // MARK: - INITIALIZERS
    
    public init(withName name: String, client: Client, andType projectType: ProjectType) {
        self.name = name
        self.client = client
        self.projectType = projectType
    }
    
    // MARK: - COMPUTED PROPERTIES
    
    var xmlDocumentEquivalent: AEXMLDocument {
        let xmldocument = AEXMLDocument()
        xmldocument.addChild(xmlElementEquivalent)
        return xmldocument
    }
    
    var xmlElementEquivalent: AEXMLElement {
        return XMLParser.unparse(project: self)
    }
    
}
