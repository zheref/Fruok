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
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var splitView: NSSplitView!
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        
        setup()
    }
    
    
    override func viewDidAppear() {
        vm.ready()
    }
    
    
    // MARK: - INSTANCE METHODS
    
    
    func setup() {
        splitView.setPosition(200, ofDividerAt: 0)
    }
    
    
    // MARK: - WorkspaceCanvasViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = WorkspaceCanvasViewModel() {
        didSet {
            
        }
    }
    
    
    func closeMyWindow() {
        window?.close()
    }
    
}
