//
//  ProjectCreationContainerViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/10/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectCreationContainerViewModelProtocol : ViewControllerModelProtocol {
    
    func userDidCancel()
    
}


class ProjectCreationContainerViewModel : ProjectCreationContainerViewModelProtocol {
    
    private var delegate: ProjectCreationCompletionDelegate? {
        if let wc = ui?.window as? ProjectCreationWindowController {
            return wc.delegate
        }
        
        return nil
    }
    
    weak var vc: ViewControllerProtocol?
    
    var ui: ProjectCreationContainerViewControllerProtocol? {
        return vc as? ProjectCreationContainerViewControllerProtocol
    }
    
    func ready() {
        ui?.presentProjectTypeSelection(withNextVM: nil)
    }
    
    
    func userDidCancel() {
        delegate?.userDidCancelProjectCreation()
    }
    
}
