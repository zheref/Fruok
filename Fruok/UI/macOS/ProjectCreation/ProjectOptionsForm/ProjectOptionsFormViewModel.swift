//
//  ProjectOptionsFormViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectOptionsFormViewModelProtocol : ViewControllerModelProtocol {
    
    func userWillingPrevious()
    
}


class ProjectOptionsFormViewModel : ProjectOptionsFormViewModelProtocol {
    
    // MARK: - PROJECTOPTIONSFORM VIEWMODEL PROTOCOL
    
    public weak var vc: ViewControllerProtocol?
    
    var ui: ProjectOptionsFormViewControllerProtocol? {
        return vc as? ProjectOptionsFormViewControllerProtocol
    }
    
    func ready() {
        
    }
    
    func userWillingPrevious() {
        ui?.changeToProjectTypeSelection()
    }
    
}
