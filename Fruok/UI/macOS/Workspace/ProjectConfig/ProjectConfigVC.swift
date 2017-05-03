//
//  ProjectConfigViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/1/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

protocol ProjectConfigDelegate : FXMLPermissioned {
    
    
    
}


protocol ProjectConfigViewControllerProtocol : ViewControllerProtocol {
    
    func refreshUI()
    
}


class ProjectConfigViewController: NSViewController, ProjectConfigViewControllerProtocol {
    
    // MARK: - CLASS MEMBERS
    
    public static func create(withDelegate delegate: ProjectConfigDelegate) -> ProjectConfigViewController {
        let storyboard = NSStoryboard(name: KUI.Storyboard.ProjectConfig.rawValue, bundle: nil)
        
        let viewController = storyboard.instantiateController(
            withIdentifier: KUI.ViewController.ProjectConfig.rawValue)
                as! ProjectConfigViewController
        
        if viewController.vm is ProjectConfigViewModelProtocol {
            (viewController.vm as! ProjectConfigViewModelProtocol).delegate = delegate
        }
        
        return viewController
    }
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var codenameTextField: NSTextField!
    @IBOutlet weak var commercialNameTextField: NSTextField!
    @IBOutlet weak var durationTextField: NSTextField!
    @IBOutlet weak var deadlineDatePicker: NSDatePicker!
    @IBOutlet weak var projectTypeComboBox: NSComboBox!
    
    // MARK: - PROPERTIES
    
    // MARK: - COMPUTED PROPERTIES
    
    var model: ProjectConfigViewModelProtocol {
        return vm as! ProjectConfigViewModelProtocol
    }
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        
        vm.ready()
    }
    
    // MARK: - ProjectConfigViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = ProjectConfigViewModel()
    
    func closeMyWindow() {
        // NOT ACTIONABLE FROM HERE
    }
    
    
    /// Fill ui form with data from model
    func refreshUI() {
        codenameTextField.stringValue = model.codename
        commercialNameTextField.stringValue = model.commercialName
        durationTextField.doubleValue = model.duration
        
        if let deadline = model.deadline {
            deadlineDatePicker.dateValue = deadline
        }
        
        projectTypeComboBox.stringValue = model.projectType?.title ?? ""
    }
    
}
