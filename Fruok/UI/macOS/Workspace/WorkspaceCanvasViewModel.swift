//
//  WorkspaceCanvasViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

public protocol WorkspaceCanvasViewModelProtocol : ViewControllerModelProtocol {
    
    
    
}


public class WorkspaceCanvasViewModel : WorkspaceCanvasViewModelProtocol {
    
    weak public var vc: ViewControllerProtocol?
    
    var ui: WorkspaceCanvasViewControllerProtocol? {
        return vc as? WorkspaceCanvasViewControllerProtocol
    }
    
    public func ready() {
        guard let document = vc?.window?.doc else {
            return
        }
        
        if !document.existsOnDisk {
            startProjectCreationFlow()
        }
    }

    fileprivate func startProjectCreationFlow() {
        ui?.window?.presentSheet(forModule: Wireframe.requestProjectCreation(withDelegate: self))
    }
    
}

extension WorkspaceCanvasViewModel : ProjectCreationCompletionDelegate {
    
    func projectCreationDidFail(becauseOf error: Error) {
        
    }
    
    func userDidCancelProjectCreation() {
        ui?.window?.close()
    }
    
    func userDidCompleteProjectCreation() {
        
    }
    
}
