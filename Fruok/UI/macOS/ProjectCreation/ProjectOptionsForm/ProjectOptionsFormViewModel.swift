//
//  ProjectOptionsFormViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectOptionsFormViewModelProtocol : ViewControllerModelProtocol {
    
    
    
}


class ProjectOptionsFormViewModel : ProjectOptionsFormViewModelProtocol {
    
    // MARK: - PROJECTOPTIONSFORM VIEWMODEL PROTOCOL
    
    public weak var vc: ViewControllerProtocol?
    
    var ui: ProjectTypeSelectionViewControllerProtocol? {
        return vc as? ProjectTypeSelectionViewControllerProtocol
    }
    
    func ready() {
        
    }
    
}
