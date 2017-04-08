//
//  ProjectCreationWindowController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/7/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

class ProjectCreationWindowController: NSWindowController {
    
    // MARK: - CLASS MEMBERS
    
    public static func create() -> ProjectCreationWindowController {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        let windowController = storyboard.instantiateController(
            withIdentifier: KUI.WindowController.ProjectCreation.rawValue) as! ProjectCreationWindowController
        return windowController
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
