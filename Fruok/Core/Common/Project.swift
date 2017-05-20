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
    
    enum Attribute : String {
        case name
        case displayName
        case duration
        case deadline
    }
    
    // MARK: - STORED PROPERTIES
    
    public let name: String
    
    public var displayName: String?
    public var duration: TimeInterval?
    public var deadline: Date?
    
    public var client: Client
    public var projectType: ProjectType
    
    // MARK: - INITIALIZERS
    
    public static var defaultToken: Project {
        let client = Client(name: "Unknown Client",
                            socialName: "Unknown Client Company",
                            socialId: nil,
                            responsible: nil,
                            email: nil,
                            phoneNumber: nil)
        
        let projectType = ProjectType(id: "unknown", relImageUrl: nil, title: "Unknown ProjectType")
        
        return Project(withName: "UntitledProject", client: client, andType: projectType)
    }
    
    public init(withName name: String, client: Client, andType projectType: ProjectType) {
        self.name = name
        self.client = client
        self.projectType = projectType
    }
    
    
    init(with projectCreationVM: ProjectCreationContainerViewModelProtocol) {
        let name = projectCreationVM.projectOptionsFormVM?.codename.value ?? ""
        
        // TODO: Use client coming from VM
        let client = Client(name: "Client name",
                            socialName: "Client social name",
                            socialId: "Client social id",
                            responsible: "Whoever",
                            email: "clientemail@domain.com",
                            phoneNumber: "")
        
        let projectType = projectCreationVM.projectTypeSelectionVM?.selectedProjectTypeModel?.projectType
            ?? ProjectType(id: "notdefined", relImageUrl: nil, title: "Not defined")
        
        self.init(withName: name, client: client, andType: projectType)
        
        if let projectOptionsFormVM = projectCreationVM.projectOptionsFormVM {
            displayName = projectOptionsFormVM.commercialName.value
            duration = Double(projectOptionsFormVM.duration.value)
            deadline = projectOptionsFormVM.deadline.value
        }
    }
    
    
    static func fromXML(_ xml: AEXMLElement) -> Project {
        return XMLParser.parseToProject(fromXML: xml)
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
