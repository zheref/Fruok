//
//  ProjectOptionsFormViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol ProjectOptionsFormViewControllerProtocol : ViewControllerProtocol {
    
    var parentVC: ProjectCreationContainerViewControllerProtocol? { get set }
    
    func changeToProjectTypeSelection()
    
}


class ProjectOptionsFormViewController: NSViewController, ProjectOptionsFormViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        vm.ready()
    }
    
    // MARK: - PROJECTTYPESELECTIONVIEWCONTROLLER PROTOCOL
    
    var vm: ViewControllerModelProtocol = ProjectOptionsFormViewModel()
    
    var model: ProjectOptionsFormViewModelProtocol {
        return vm as! ProjectOptionsFormViewModelProtocol
    }
    
    var parentVC: ProjectCreationContainerViewControllerProtocol?
    
    func changeToProjectTypeSelection() {
        parentVC?.presentProjectTypeSelection(withNextVM: model)
    }
    
    // MARK: - ACTIONS
    
    @IBAction func userDidClickPrevious(_ sender: Any) {
        model.userWillingPrevious()
    }
    
    @IBAction func userDidChangeText(_ sender: NSTextField) {
        
    }
    
    
}
