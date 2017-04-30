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
    
    func presentProjectTypeSelection(
        withNextVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol?)
    
    func presentProjectOptionsForm(
        withPreviousVM projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol)
    
    func completeSaveProcess(
        withCurrentVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol)
    
    func openSavePanel(forProjectNamed projectName: String,
                       toReturnURLBy urlReturner: @escaping (URL?) -> Void)
    
    func finishByDismissingWindow()
}


class ProjectCreationContainerViewController:
    NSViewController, ProjectCreationContainerViewControllerProtocol {
    
    // MARK: - SUB VIEWCONTROLLERS
    
    private var projectTypeSelectionViewController: ProjectTypeSelectionViewController?
    private var projectOptionsFormViewController: ProjectOptionsFormViewController?
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.vc = self
        vm.ready()
    }
    
    
    // MARK: - PROJECTCREATIONCONTAINER VIEWCONTROLLER PROTOCOL
    
    public var vm: ViewControllerModelProtocol = ProjectCreationContainerViewModel()
    
    var model: ProjectCreationContainerViewModelProtocol {
        return vm as! ProjectCreationContainerViewModelProtocol
    }
    
    
    func cancelByDismissingWindow() {
        window?.dismissAsSheet()
        model.userDidCancel()
    }
    
    
    func finishByDismissingWindow() {
        window?.dismissAsSheet()
    }
    
    
    func presentProjectTypeSelection(
        withNextVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol? = nil) {
        
        model.projectOptionsFormVM = projectOptionsFormVM
        
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectCreation.rawValue, bundle: nil)
        
        let projectTypeSelectionVCIdentifier = KUI.ViewController.ProjectTypeSelection.rawValue
        
        let projectTypeSelectionVC =
            storyboard.instantiateController(withIdentifier: projectTypeSelectionVCIdentifier)
                as! NSViewController
        
        if let projectTypeSelectionVC =
            projectTypeSelectionVC as? ProjectTypeSelectionViewController {
            
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
    
    
    /// Display Project Options Form VC
    /// Brings **Project Type Selection** VM to save it
    func presentProjectOptionsForm(
        withPreviousVM projectTypeSelectionVM: ProjectTypeSelectionViewModelProtocol) {
        
        model.projectTypeSelectionVM = projectTypeSelectionVM
        
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
    
    
    func completeSaveProcess(
        withCurrentVM projectOptionsFormVM: ProjectOptionsFormViewModelProtocol) {
        
        model.projectOptionsFormVM = projectOptionsFormVM
        model.userDidFinishSaveProcess()
    }
    
    
    func openSavePanel(forProjectNamed projectName: String,
                       toReturnURLBy urlReturner: @escaping (URL?) -> Void) {
        guard let hostWindow = view.window else {
            return
        }
        
        let panel = NSSavePanel()
        panel.nameFieldStringValue = "\(projectName).fruok"
        panel.allowedFileTypes = ["fruok"]
        panel.isExtensionHidden = true
        
        panel.beginSheetModal(for: hostWindow) { (result) in
            if result == NSFileHandlingPanelOKButton {
                urlReturner(panel.url)
            }
        }
    }
    
}
