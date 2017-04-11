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
    
}


class ProjectOptionsFormViewController: NSViewController, ProjectOptionsFormViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - PROJECTTYPESELECTIONVIEWCONTROLLER PROTOCOL
    
    var vm: ViewControllerModelProtocol = ProjectOptionsFormViewModel()
    
    var parentVC: ProjectCreationContainerViewControllerProtocol?
    
    // MARK: - ACTIONS
    
    @IBAction func userDidChangeText(_ sender: NSTextField) {
        
    }
    
    
}
