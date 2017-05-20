//
//  XMLParser.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import AEXML


class XMLParser {
    
    private func unparse(_ compliant: XMLCompliantProtocol) {
        let xmldocument = AEXMLDocument()
        
        let attributes = ["xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
                          "xmlns:xsd": "http://www.w3.org/2001/XMLSchema"]
        
        let project = xmldocument.addChild(name: "frk:project", attributes: attributes)
        
        project.addChild(name: "frk:freelance", value: "Sergio Daniel Lozano Garcia",
                         attributes: ["frk:title": "Software Engineer"])
        
        project.addChild(name: "frk:client", value: "Universidad de Ibague",
                         attributes: ["frk:socialid": "988717254-2"])
    }
    
    // Unparse project instance into its XML equivalent element and returns it
    static func unparse(project: Project) -> AEXMLElement {
        var attributes = [String: String]();
        
        attributes[Project.Attribute.name.rawValue] = project.name
        
        if let displayName = project.displayName {
            attributes[Project.Attribute.displayName.rawValue] = displayName
        }
        
        if let duration = project.duration {
            attributes[Project.Attribute.duration.rawValue] = duration.description
        }
        
        if let deadline = project.deadline {
            attributes[Project.Attribute.deadline.rawValue] = deadline.timeIntervalSince1970.description
        }
        
        let xmlElement = AEXMLElement(name: Project.TagName,
                                      attributes: attributes)
        
        xmlElement.addChild(project.client.xmlElementEquivalent)
        xmlElement.addChild(project.projectType.xmlElementEquivalent)
        
        return xmlElement
    }
    
    
    private static func parse(fromXML xml: AEXMLElement) -> XMLElementProtocol? {
        switch xml.name {
        case Project.TagName:
            return XMLParser.parseToProject(fromXML: xml)
        case Client.TagName:
            return XMLParser.parseToClient(fromXML: xml)
        default:
            return nil
        }
    }
    
    
    static func parseToProject(fromXML xml: AEXMLElement) -> Project {
        let codename = xml.attributes[Project.Attribute.name.rawValue] ?? ""
        
        var client: Client?
        
        if let clientTag = xml.firstTag(withName: Client.TagName) {
            client = XMLParser.parseToClient(fromXML: clientTag)
        }
        
        var projectType: ProjectType?
        
        if let projectTypeTag = xml.firstTag(withName: ProjectType.TagName) {
            projectType = XMLParser.parseToProjectType(xml: projectTypeTag)
        }
        
        guard let safeClient = client, let safeProjectType = projectType else {
            return Project.defaultToken
        }
        
        var project = Project(withName: codename, client: safeClient, andType: safeProjectType)
        
        project.displayName = xml.attributes[Project.Attribute.displayName.rawValue] ?? ""
        
        if let durationStr = xml.attributes[Project.Attribute.duration.rawValue] {
            project.duration = Double(durationStr) ?? 0
        }
        
        if let deadlineSince1970Str = xml.attributes[Project.Attribute.deadline.rawValue] {
            if let deadlineSince1970 = Double(deadlineSince1970Str) {
                project.deadline = Date(timeIntervalSince1970: deadlineSince1970)
            }
        }
        
        return project
    }
    
    
    // Unparse project type instance into its XML equivalent element and returns it
    static func unparse(projectType: ProjectType) -> AEXMLElement {
        var attributes = [String: String]();
        
        attributes[ProjectType.Attribute.id.rawValue] = projectType.id
        
        if let relImageUrl = projectType.relImageUrl {
            attributes[ProjectType.Attribute.relImageUrl.rawValue] = relImageUrl
        }
        
        let xmlElement = AEXMLElement(name: ProjectType.TagName,
                                      value: projectType.title,
                                      attributes: attributes)
        
        return xmlElement
    }
    
    
    static func parseToProjectType(xml: AEXMLElement) -> ProjectType {
        let title = xml.value ?? ""
        
        let relImageUrl = xml.attributes[ProjectType.Attribute.relImageUrl.rawValue] ?? nil
        let id = xml.attributes[ProjectType.Attribute.id.rawValue] ?? ""
        
        return ProjectType(id: id, relImageUrl: relImageUrl, title: title)
    }
    
    
    // Unparse client instance into ints XML equivalent element and returns it
    static func unparse(client: Client) -> AEXMLElement {
        var attributes = [String: String]();
        
        if let socialName = client.socialName {
            attributes[Client.Attribute.socialName.rawValue] = socialName
        }
        
        if let responsible = client.responsible {
            attributes[Client.Attribute.responsible.rawValue] = responsible
        }
        
        if let email = client.email {
            attributes[Client.Attribute.email.rawValue] = email
        }
        
        if let phoneNumber = client.phoneNumber {
            attributes[Client.Attribute.phoneNumber.rawValue] = phoneNumber
        }
        
        let xmlElement = AEXMLElement(name: Client.TagName,
                                      value: client.name,
                                      attributes: attributes)
        
        return xmlElement
    }
    
    
    static func parseToClient(fromXML xml: AEXMLElement) -> Client {
        let name = xml.value ?? ""
        
        let socialName = xml.attributes[Client.Attribute.socialName.rawValue] ?? ""
        let responsible = xml.attributes[Client.Attribute.responsible.rawValue] ?? ""
        let email = xml.attributes[Client.Attribute.email.rawValue] ?? ""
        let phoneNumber = xml.attributes[Client.Attribute.phoneNumber.rawValue] ?? ""
        
        let client = Client(name: name,
                            socialName: socialName,
                            socialId: nil,
                            responsible: responsible,
                            email: email,
                            phoneNumber: phoneNumber)
        
        return client
    }
    
    
}
