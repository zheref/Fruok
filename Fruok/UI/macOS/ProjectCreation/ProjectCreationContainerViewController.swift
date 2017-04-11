//
//  ProjectCreationContainerViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/10/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol ProjectCreationContainerViewControllerProtocol : ViewControllerProtocol {
    
    func cancelByDismissingWindow()
    
    func presentProjectTypeSelection(withNextVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol?)
    
    func presentProjectOptionsForm(withPreviousVM projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol)
    
}


class ProjectCreationContainerViewController: NSViewController, ProjectCreationContainerViewControllerProtocol {
    
    // MARK: - SUB VIEWCONTROLLERS
    
    private var projectTypeSelectionViewController: ProjectTypeSelectionViewController?
    private var projectOptionsFormViewController: ProjectOptionsFormViewController?
    
    // MARK: - PROJECTCREATIONCONTAINER VIEWCONTROLLER PROTOCOL
    
    public var vm: ViewControllerModelProtocol = ProjectCreationContainerViewModel()
    
    func cancelByDismissingWindow() {
        guard let window = view.window else { /* Report error */ return }
        
        window.sheetParent?.endSheet(window)
    }
    
    func presentProjectTypeSelection(withNextVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol? = nil) {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        
        let projectTypeSelectionVCIdentifier = KUI.ViewController.ProjectTypeSelection.rawValue
        
        let projectTypeSelectionVC =
            storyboard.instantiateController(withIdentifier: projectTypeSelectionVCIdentifier)
                as! NSViewController
        
        if let projectTypeSelectionVC = projectTypeSelectionVC as? ProjectTypeSelectionViewController {
            projectTypeSelectionVC.parentVC = self
            projectTypeSelectionViewController = projectTypeSelectionVC
        }
        
        insertChildViewController(projectTypeSelectionVC, at: 0)
        projectOptionsFormViewController?.view.removeFromSuperview()
        view.addSubview(projectTypeSelectionVC.view)
        view.frame = projectTypeSelectionVC.view.frame
        
        if projectOptionsFormVM != nil {
            view.window?.setFrame(projectTypeSelectionVC.view.frame, display: true, animate: true)
        }
    }
    
    func presentProjectOptionsForm(withPreviousVM projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol) {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        
        let projectOptionsFormVCIdentifier = KUI.ViewController.ProjectOptionsForm.rawValue
        
        let projectOptionsFormVC =
            storyboard.instantiateController(withIdentifier: projectOptionsFormVCIdentifier)
                as! NSViewController
        
        if let projectOptionsFormVC = projectOptionsFormVC as? ProjectOptionsFormViewController {
            projectOptionsFormVC.parentVC = self
            projectOptionsFormViewController = projectOptionsFormVC
        }
        
        insertChildViewController(projectOptionsFormVC, at: 0)
        projectTypeSelectionViewController?.view.removeFromSuperview()
        view.addSubview(projectOptionsFormVC.view)
        view.frame = projectOptionsFormVC.view.frame
        
        view.window?.setFrame(projectOptionsFormVC.view.frame, display: true, animate: true)
    }
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.vc = self
        vm.ready()
    }
    
    
    
}
