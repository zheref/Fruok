//
//  WorkspaceWindowController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

public class WorkspaceWindowController: NSWindowController, WindowControllerProtocol {
    
    // MARK: - CLASS MEMBERS
    
    public static func create() -> WorkspaceWindowController {
        let storyboard = NSStoryboard(name: KUI.Storyboard.Workspace.rawValue, bundle: nil)
        let windowController = storyboard.instantiateController(
            withIdentifier: KUI.WindowController.Workspace.rawValue) as! WorkspaceWindowController
        return windowController
    }
    
    // MARK: - PROPERTIES
    
    var projectCreationWC: ProjectCreationWindowController?
    
    // MARK: - LIFECYCLE
    
    override public func windowDidLoad() {
        super.windowDidLoad()
    }
    
    // MARK: - INSTANCE METHODS
    
    // MARK: - WINDOWCONTROLLER PROTOCOL
    
    public var doc: DocumentProtocol? {
        return document as? DocumentProtocol
    }
    
    public func presentSheet(forModule module: ModuleProtocol) {
        if let targetWindow = module.wc.window {
            window?.beginSheet(targetWindow, completionHandler: { response in
                // Completion
            })
        } else {
            // Report error
        }
    }

    public func presentedViewDidAppear() {
        
    }
    
}
