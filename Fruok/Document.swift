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
class Document: FruokDocument {
    
    // MARK: - CONSTANTS
    
    private static let ExtensionPLKey = "FileExtension"
    
    // MARK: - PROPERTIES
    
    var content: FXMLContent
    
    // MARK: - INITIALIZERS
    

    override init() {
        self.content = FXMLContent()
        
        super.init()
    }
    
    
    // MARK: - NSDOCUMENT OVERRIDES
    
    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        addWindowController(Wireframe.requestWorkspace().wc)
    }
    

    override func data(ofType typeName: String) throws -> Data {
        if let data = content.xml.data(using: .utf8) {
            return data
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }
    

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

