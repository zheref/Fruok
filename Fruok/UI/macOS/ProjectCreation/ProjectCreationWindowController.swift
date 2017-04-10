//
//  ProjectCreationWindowController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/7/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

class ProjectCreationWindowController: NSWindowController, WindowControllerProtocol {
    // MARK: - CLASS MEMBERS
    
    public static func create(withDelegate delegate: ProjectCreationCompletionDelegate) -> ProjectCreationWindowController {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        let windowController = storyboard.instantiateController(
            withIdentifier: KUI.WindowController.ProjectCreation.rawValue) as! ProjectCreationWindowController
        windowController.delegate = delegate
        return windowController
    }
    
    // MARK: - INSTANCE MEMBERS
    
    var delegate: ProjectCreationCompletionDelegate?
    
    // MARK: - LIFECYCLE

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    // MARK: - WINDOWCONTROLLER PROTOCOL
    
    public var doc: DocumentProtocol? {
        return document as? DocumentProtocol
    }
    
    public func presentSheet(forModule module: ModuleProtocol) {
        
    }
    
    public func dismissSheet(forModule module: ModuleProtocol) {
        
    }
    
    public func presentedViewDidAppear() {
        
    }

}
