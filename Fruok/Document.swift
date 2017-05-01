//
//  Document.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa
import AEXML


// This is the custom model representation of a document specific for Fruok
public class Document: FruokDocument {
    
    // MARK: - CONSTANTS
    
    private static let ExtensionPLKey = "FileExtension"
    private static let FileEncoding = String.Encoding.utf8
    
    // MARK: - PROPERTIES
    
    var content: FXMLContent
    
    // MARK: - COMPUTED PROPERTIES
    
    var project: Project? {
        get { return content.project }
        set {
            content.project = newValue
            content.updateXML()
        }
    }
    
    // MARK: - INITIALIZERS
    

    override init() {
        self.content = FXMLContent()
        
        super.init()
    }
    
    
    // MARK: - NSDOCUMENT OVERRIDES
    
    override public class func autosavesInPlace() -> Bool {
        return true
    }

    override public func makeWindowControllers() {
        addWindowController(Wireframe.requestWorkspace().wc)
    }
    

    override public func data(ofType typeName: String) throws -> Data {
        if let data = content.xml.data(using: Document.FileEncoding) {
            return data
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }
    

    override public func read(from data: Data, ofType typeName: String) throws {
        if let fileContent = String(data: data, encoding: Document.FileEncoding) {
            do {
                content = try FXMLContent.from(xmlString: fileContent)
            } catch {
                throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
            }
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
        
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
    }


}

