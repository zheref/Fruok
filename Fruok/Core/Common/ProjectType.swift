//
//  ProjectType.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML

public struct ProjectType : XMLElementProtocol, Equatable, CustomStringConvertible {
    
    // MARK: - CLASS CONSTANTS
    
    static var TagName = "projecttype"
    
    enum Attribute : String {
        case id
        case relImageUrl
    }
    
    // MARK: - STORED PROPERTIES
    
    public let id: String
    
    public var relImageUrl: String?
    
    public let title: String
    
    // MARK: - COMPUTED PROPERTIES
    
    var xmlElementEquivalent: AEXMLElement {
        return XMLParser.unparse(projectType: self)
    }
    
    // MARK: - EQUATABLE
    
    public static func ==(lhs: ProjectType, rhs: ProjectType) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }
    
    public var description: String {
        return title
    }
    
}
