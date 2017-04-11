//
//  ProjectOptionsFormViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

// MARK: - INTERFACE

protocol ProjectOptionsFormViewModelProtocol : ViewControllerModelProtocol {
    
    func userDidCancel()
    
    func userWillingPrevious()
    
}

// MARK: - IMPLEMENTATION

class ProjectOptionsFormViewModel : ProjectOptionsFormViewModelProtocol {
    
    // MARK: INSTANCE PROPERTIES
    
    var codename = ""
    var commercialName = ""
    
    var duration: Int = 0
    var deadline: Date = Date()
    
    var clientCode = ""
    var clientName = ""
    
    // MARK: - PROJECT OPTIONS FORM VIEWMODEL PROTOCOL
    
    public weak var vc: ViewControllerProtocol?
    
    var ui: ProjectOptionsFormViewControllerProtocol? {
        return vc as? ProjectOptionsFormViewControllerProtocol
    }
    
    
    func ready() {
        loadClients()
    }
    
    
    func userDidCancel() {
        ui?.cancelByDismissing()
    }
    
    
    func userWillingPrevious() {
        ui?.changeToProjectTypeSelection()
    }
    
    // MARK: INSTANCE METHODS
    
    func loadClients() {
        // TODO: Implement load clients from XML
    }
    
    
}
