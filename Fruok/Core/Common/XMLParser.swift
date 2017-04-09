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
        
        attributes[Project.NameAttrName] = project.name
        
        if let displayName = project.displayName {
            attributes[Project.DisplayNameAttrName] = displayName
        }
        
        if let duration = project.duration {
            attributes[Project.DurationAttrName] = duration.description
        }
        
        if let deadline = project.deadline {
            attributes[Project.DeadlineAttrName] = deadline.description
        }
        
        let xmlElement = AEXMLElement(name: Project.TagName,
                                      attributes: attributes)
        
        xmlElement.addChild(project.client.xmlElementEquivalent)
        xmlElement.addChild(project.projectType.xmlElementEquivalent)
        
        return xmlElement
    }
    
    // Unparse project type instance into its XML equivalent element and returns it
    static func unparse(projectType: ProjectType) -> AEXMLElement {
        var attributes = [String: String]();
        
        attributes[ProjectType.IdAttrName] = projectType.id
        
        if let relImageUrl = projectType.relImageUrl {
            attributes[ProjectType.RelImageUrlAttrName] = relImageUrl
        }
        
        let xmlElement = AEXMLElement(name: ProjectType.TagName,
                                      value: projectType.title,
                                      attributes: attributes)
        
        return xmlElement
    }
    
//    static func parse(xml: AEXMLElement) -> ProjectType {
//        
//    }
    
    // Unparse client instance into ints XML equivalent element and returns it
    static func unparse(client: Client) -> AEXMLElement {
        var attributes = [String: String]();
        
        if let socialName = client.socialName {
            attributes[Client.SocialNameAttrName] = socialName
        }
        
        if let socialId = client.socialId {
            attributes[Client.SocialIdAttrName] = socialId
        }
        
        if let responsible = client.socialName {
            attributes[Client.ResponsibleAttrName] = responsible
        }
        
        if let email = client.email {
            attributes[Client.EmailAttrName] = email
        }
        
        if let phoneNumber = client.phoneNumber {
            attributes[Client.PhoneNumberAttrName] = phoneNumber
        }
        
        let xmlElement = AEXMLElement(name: Client.TagName,
                                      value: client.name,
                                      attributes: attributes)
        
        return xmlElement
    }
    
    
}
