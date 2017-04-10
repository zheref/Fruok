//
//  FruokWireframe.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

class FruokWireframe {
    
    private var workspace: FruokModule?
    
    func requestWorkspace() -> FruokModule {
        if let module = workspace {
            return module
        } else {
            workspace = FruokModule(withWindowController: WorkspaceWindowController.create())
            return workspace!
        }
    }
    
    func releaseWorkspace() {
        workspace = nil
    }
    
    private var projectCreation: FruokModule?
    
    func requestProjectCreation(withDelegate delegate: ProjectCreationCompletionDelegate) -> FruokModule {
        if projectCreation == nil {
            let wc = ProjectCreationWindowController.create(withDelegate: delegate)
            projectCreation = FruokModule(withWindowController: wc)
        }
        
        return projectCreation!
    }
    
    func releaseProjectCreation() {
        projectCreation = nil
    }

}

let Wireframe = FruokWireframe()
