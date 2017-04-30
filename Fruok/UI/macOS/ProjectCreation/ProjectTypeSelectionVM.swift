//
//  ProjectTypeSelectionViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectTypeSelectionViewModelProtocol : ViewControllerModelProtocol {

    var itemsCount: Int { get }
    
    var projectTypesModels: [ProjectTypeCollectionItemViewModel] { get }
    
    func userDidCancel()
    
    func userWillingNext()
    
    var selectedProjectTypeModel: ProjectTypeCollectionItemViewModel? { get set }

}


class ProjectTypeSelectionViewModel: ProjectTypeSelectionViewModelProtocol {
    
    // MARK: - INSTANCE MEMBERS
    
    // MARK: Instance Properties
    
    private var projectTypes = [ProjectType]()
    
    var selectedProjectTypeModel: ProjectTypeCollectionItemViewModel?
    
    // MARK: Computed Properties
    
    var itemsCount: Int {
        return projectTypes.count
    }
    
    lazy var projectTypesModels: [ProjectTypeCollectionItemViewModel] = {
        [unowned self] in
        return self.projectTypes.map({ (projectType) -> ProjectTypeCollectionItemViewModel in
            return ProjectTypeCollectionItemViewModel(withModel: projectType)
        })
    }()
    
    // MARK: - PROJECTTYPESELECTION VIEWMODEL PROTOCOL

    public weak var vc: ViewControllerProtocol?
    
    var ui: ProjectTypeSelectionViewControllerProtocol? {
        return vc as? ProjectTypeSelectionViewControllerProtocol
    }
    
    func ready() {
        ProjectTypesManager.shared.readProjectTypes {
            [weak self] projectTypes in
            if let this = self {
                this.projectTypes = projectTypes
                this.ui?.reload()
            }
        }
    }
    
    
    func userDidCancel() {
        ui?.cancelByDismissing()
        
//        if let window = ui?.window as? ProjectCreationWindowController {
//            window.delegate?.userDidCancelProjectCreation()
//        }
    }
    
    
    func userWillingNext() {
        ui?.changeToProjectOptionsForm()
    }

}
