//
//  ProjectConfigVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/1/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectConfigViewModelProtocol : ViewControllerModelProtocol {
    
    var delegate: ProjectConfigDelegate? { get set }
    
    var codename: String { get set }
    
    var commercialName: String { get set }
    
    var duration: TimeInterval { get set }
    
    var deadline: Date? { get set }
    
    var projectType: ProjectType? { get set }
    
}


class ProjectConfigViewModel : ProjectConfigViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    var codename = ""
    
    var commercialName = ""
    
    var duration: TimeInterval = 0
    
    var deadline: Date? = nil
    
    var projectType: ProjectType?
    
    var delegate: ProjectConfigDelegate?
    
    // MARK: - COMPUTED PROPERTIES
    
    var ui: ProjectConfigViewControllerProtocol? {
        return vc as? ProjectConfigViewControllerProtocol
    }
    
    // MARK: - ProjectConfigViewModelProtocol
    
    weak var vc: ViewControllerProtocol?
    
    
    func ready() {
        fillModelDataFromSource()
        ui?.refreshUI()
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
