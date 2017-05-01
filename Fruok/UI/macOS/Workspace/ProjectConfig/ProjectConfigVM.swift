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
    
}


class ProjectConfigViewModel : ProjectConfigViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    var codename = ""
    
    var commercialName = ""
    
    var duration = 0
    
    var deadline = Date()
    
    var projectType: ProjectType?
    
    var delegate: ProjectConfigDelegate?
    
    // MARK: - ProjectConfigViewModelProtocol
    
    weak var vc: ViewControllerProtocol?
    
    
    func ready() {
        
    }
    
}
