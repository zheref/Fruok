//
//  ProjectOptionsFormViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation
import Bond

// MARK: - INTERFACE

protocol ProjectOptionsFormViewModelProtocol : ViewControllerModelProtocol {
    
    var codename: Observable<String> { get set }
    var commercialName: Observable<String> { get set }
    
    var duration: Observable<Int> { get set }
    var deadline: Observable<Date> { get set }
    
    var clientCode: Observable<String> { get set }
    var clientName: Observable<String> { get set }
    
    func userDidCancel()
    
    func userWillingPrevious()
    
    func userWillingToFinishSave()
    
}

// MARK: - IMPLEMENTATION


class ProjectOptionsFormViewModel : ProjectOptionsFormViewModelProtocol {
    
    // MARK: INSTANCE PROPERTIES
    
    var codename = Observable("")
    var commercialName = Observable("")
    
    var duration = Observable(30)
    var deadline = Observable(Date())
    
    var clientCode = Observable("")
    var clientName = Observable("")
    
    // MARK: - PROJECT OPTIONS FORM VIEWMODEL PROTOCOL
    
    public var persistanceReady = false
    
    public weak var vc: ViewControllerProtocol?
    
    var ui: ProjectOptionsFormViewControllerProtocol? {
        return vc as? ProjectOptionsFormViewControllerProtocol
    }
    
    
    func ready() {
        loadClients()
    }
    
    
    func persistIfNeeded() {
        
    }
    
    
    func userDidCancel() {
        ui?.cancelByDismissing()
    }
    
    
    func userWillingPrevious() {
        ui?.changeToProjectTypeSelection()
    }
    
    
    func userWillingToFinishSave() {
        ui?.bringUpPathPickerForSaving()
    }
    
    
    // MARK: INSTANCE METHODS
    
    
    func loadClients() {
        // TODO: Implement load clients from XML
    }
    
    
}
