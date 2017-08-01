//
//  ProjectConfigVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/1/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectConfigDelegate : FXMLPermissioned {
    
    
    
}

// MARK: - INTERFACE

protocol ProjectConfigViewModelProtocol : ViewControllerModelProtocol {
    
    var delegate: ProjectConfigDelegate? { get set }
    
    var codename: String { get set }
    
    var commercialName: String { get set }
    
    var duration: TimeInterval { get set }
    
    var deadline: Date? { get set }
    
    var projectType: ProjectType? { get set }
    
}

// MARK: - IMPLEMENTATION

/// Use this as example of how to handle IO whe not using binders
class ProjectConfigViewModel : ProjectConfigViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    var codename = ""
    
    var commercialName = "" {
        didSet {
            if persistanceReady {
                delegate?.fxml?.project?.displayName = commercialName
            }
        }
    }
    
    var duration: TimeInterval = 0 {
        didSet {
            if persistanceReady {
                delegate?.fxml?.project?.duration = duration
            }
        }
    }
    
    var deadline: Date? = nil
    
    var projectType: ProjectType?
    
    var delegate: ProjectConfigDelegate?
    
    // MARK: - COMPUTED PROPERTIES
    
    var ui: ProjectConfigViewControllerProtocol? {
        return vc as? ProjectConfigViewControllerProtocol
    }
    
    // MARK: - ProjectConfigViewModelProtocol
    
    public var persistanceReady = false
    
    weak var vc: ViewControllerProtocol?
    
    func ready() {
        fillModelDataFromSource()
        ui?.refreshUI()
        
        persistanceReady = true
    }
    
    func persistIfNeeded() {
        delegate?.persist()
    }
    
    // MARK: - INSTANCE METHODS
    
    
    private func fillModelDataFromSource() {
        guard let project = delegate?.fxml?.project else {
            return
        }
        
        codename = project.name
        commercialName = project.displayName ?? ""
        duration = project.duration ?? TimeInterval()
        deadline = project.deadline
        
        projectType = project.projectType
    }
    
}
