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
    
    // MARK: - COMPUTED PROPERTIES
    
    var model: ProjectConfigViewModelProtocol {
        return vm as! ProjectConfigViewModelProtocol
    }
    
    
    // MARK: - PROPERTIES
    
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshUI()
    }
    
    // MARK: - ProjectConfigViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = ProjectConfigViewModel()
    
    
    func closeMyWindow() {
        // NOT ACTIONABLE FROM HERE
    }
    
    
    func refreshUI() {
        guard let delegate = model.delegate,
            let fxml = delegate.fxml,
            let project = fxml.project else {
            return
        }
        
        codenameTextField.stringValue = project.name
        
        if let displayName = project.displayName {
            commercialNameTextField.stringValue = displayName
        }
        
        if let duration = project.duration {
            durationTextField.stringValue = String(duration)
        }
        
        if let deadline = project.deadline {
            deadlineDatePicker.dateValue = deadline
        }
        
        // TODO: Config project type combo box
        
    }
    
}
