//
//  ProjectConfigViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/1/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

protocol ProjectConfigDelegate {
    
    
    
}


protocol ProjectConfigViewControllerProtocol : ViewControllerProtocol {
    
    
    
}


class ProjectConfigViewController: NSViewController, ProjectConfigViewControllerProtocol {
    
    // MARK: - CLASS MEMBERS
    
    public static func create(withDelegate delegate: ProjectConfigDelegate) -> ProjectConfigViewController {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectConfig.rawValue, bundle: nil)
        
        let viewController = storyboard.instantiateController(
            withIdentifier: KUI.ViewController.ProjectConfig.rawValue)
                as! ProjectConfigViewController
        
        viewController.delegate = delegate
        
        return viewController
    }
    
    // MARK: - PROPERTIES
    
    var delegate: ProjectConfigDelegate?
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    // MARK: - ProjectConfigViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = ProjectConfigViewModel()
    
    func closeMyWindow() {
        // NOT ACTIONABLE FROM HERE
    }
    
}
