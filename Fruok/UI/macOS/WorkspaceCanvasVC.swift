//
//  WorkspaceCanvasViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol WorkspaceCanvasViewControllerProtocol : ViewControllerProtocol {
    
}


class WorkspaceCanvasViewController: NSViewController, WorkspaceCanvasViewControllerProtocol {
    
    var vm: ViewControllerModelProtocol = WorkspaceCanvasViewModel() {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
    }
    
    override func viewDidAppear() {
        vm.ready()
    }
    
}