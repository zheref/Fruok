//
//  ProjectConfigViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/1/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


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
        
        deadlineDatePicker.delegate = self
        
        vm.vc = self
        vm.ready()
    }
    
    // MARK: - ProjectConfigViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = ProjectConfigViewModel()
    
    
    func closeMyWindow() {
        // NOT ACTIONABLE FROM HERE
    }
    
    
    func refreshUI() {
        
        codenameTextField.stringValue = model.codename
        
        commercialNameTextField.stringValue = model.commercialName
        
        durationTextField.stringValue = String(model.duration)
        
        if let deadline = model.deadline {
            deadlineDatePicker.dateValue = deadline
        }
        
        projectTypeComboBox.reloadData()
        
        if let preselectedIndex = model.projectTypeIndexInDataSource {
            projectTypeComboBox.selectItem(at: preselectedIndex)
        }
        
        // TODO: Config project type combo box
        
    }
    
    // MARK: - ACTIONS
    
    
    
}


extension ProjectConfigViewController : NSTextFieldDelegate {
    
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        switch control {
        case codenameTextField:
            // Codename should not be modified
            break
        case commercialNameTextField:
            if let str = fieldEditor.string {
                model.commercialName = str
            }
        case durationTextField:
            if let str = fieldEditor.string {
                if let duration = str.asDouble {
                    model.duration = duration
                } else {
                    // TODO: Handle parsing error
                }
            }
        default:
            break
        }
        
        return true
    }
    
}


extension ProjectConfigViewController : NSDatePickerCellDelegate {
    
    func datePickerCell(_ datePickerCell: NSDatePickerCell,
                        validateProposedDateValue proposedDateValue: AutoreleasingUnsafeMutablePointer<NSDate>,
                        timeInterval proposedTimeInterval: UnsafeMutablePointer<TimeInterval>?) {
        
        model.deadline = proposedDateValue.pointee as Date
    }
    
}


extension ProjectConfigViewController : NSComboBoxDataSource {
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return model.projectTypes.count
    }
    
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return model.projectTypes[index]
    }
    
    
    func comboBox(_ comboBox: NSComboBox, indexOfItemWithStringValue string: String) -> Int {
        if let firstMatching = model.projectTypes.first(where: { $0.title == string }) {
            if let index = model.projectTypes.index(of: firstMatching) {
                return index
            } else {
                return -1
            }
        } else {
            return -1
        }
    }
    
    
    func comboBox(_ comboBox: NSComboBox, completedString string: String) -> String? {
        return model.projectTypes.first(where: { $0.title.hasPrefix(string) })?.title
    }
    
}

extension ProjectConfigViewController : NSComboBoxDelegate {
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        let selected = model.projectTypes[projectTypeComboBox.indexOfSelectedItem]
        model.projectType = selected
    }
    
}
