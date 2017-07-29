//
//  ProjectCreationContainerViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/10/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectCreationContainerViewModelProtocol : ViewControllerModelProtocol {
    
    weak var projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol? { get set }
    
    weak var projectOptionsFormVM: ProjectOptionsFormViewModelProtocol? { get  set }
    
    func userDidCancel()
    
    func userDidFinishSaveProcess()
    
}


class ProjectCreationContainerViewModel : ProjectCreationContainerViewModelProtocol {
    
    // MARK: - INSTANCE MEMBERS
    
    private var delegate: ProjectCreationCompletionDelegate? {
        if let wc = ui?.window as? ProjectCreationWindowController {
            return wc.delegate
        }
        
        return nil
    }
    
    weak var vc: ViewControllerProtocol?
    
    weak var projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol?
    
    weak var projectOptionsFormVM: ProjectOptionsFormViewModelProtocol?
    
    var urlToSave: URL?
    
    var ui: ProjectCreationContainerViewControllerProtocol? {
        return vc as? ProjectCreationContainerViewControllerProtocol
    }
    
    
    func ready() {
        ui?.presentProjectTypeSelection(withNextVM: nil)
    }
    
    
    func persistIfNeeded() {
        
    }
    
    
    func userDidCancel() {
        delegate?.userDidCancelProjectCreation()
    }
    
    
    func userDidFinishSaveProcess() {
        if let projectName = projectOptionsFormVM?.codename.value {
            ui?.openSavePanel(forProjectNamed: projectName, toReturnURLBy: { [unowned self] (url) in
                self.urlToSave = url
                self.delegate?.userDidCompleteProjectCreation(withCompletionVM: self)
                self.ui?.finishByDismissingWindow()
            })
        }
    }
    
}
