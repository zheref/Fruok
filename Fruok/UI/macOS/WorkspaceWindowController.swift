//
//  WorkspaceWindowController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

public class WorkspaceWindowController: NSWindowController {
    
    public static func make() -> WorkspaceWindowController {
        let storyboard = NSStoryboard(name: "Workspace", bundle: nil)
        let windowController = storyboard.instantiateController(
            withIdentifier: "WorkspaceWindowController") as! WorkspaceWindowController
        return windowController
    }
    
    override public func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
