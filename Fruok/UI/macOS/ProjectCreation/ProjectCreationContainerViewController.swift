//
//  ProjectCreationContainerViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/10/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol ProjectCreationContainerViewControllerProtocol : ViewControllerProtocol {
    
    func presentProjectTypeSelection()
    
}


class ProjectCreationContainerViewController: NSViewController, ProjectCreationContainerViewControllerProtocol {
    
    // MARK: - PROJECTCREATIONCONTAINER VIEWCONTROLLER PROTOCOL
    
    public var vm: ViewControllerModelProtocol = ProjectCreationContainerViewModel()
    
    func presentProjectTypeSelection() {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        
        let projectTypeSelectionVCIdentifier = KUI.ViewController.ProjectTypeSelection.rawValue
        
        let projectTypeSelectionVC =
            storyboard.instantiateController(withIdentifier: projectTypeSelectionVCIdentifier)
                as! NSViewController
        
        insertChildViewController(projectTypeSelectionVC, at: 0)
        view.addSubview(projectTypeSelectionVC.view)
        view.frame = projectTypeSelectionVC.view.frame
    }
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.vc = self
        vm.ready()
    }
    
    
    
}
