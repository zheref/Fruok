//
//  ProjectType.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML

public struct ProjectType : XMLElementProtocol {
    
    // MARK: - CLASS CONSTANTS
    
    static var TagName = "projecttype"
    
    static let RelImageUrlAttrName = "relImageUrl"
    
    static let IdAttrName = "id"
    
    // MARK: - STORED PROPERTIES
    
    public let id: String
    
    public var relImageUrl: String?
    
    public let title: String
    
    // MARK: - COMPUTED PROPERTIES
    
    var xmlElementEquivalent: AEXMLElement {
        return XMLParser.unparse(projectType: self)
    }
    
}
