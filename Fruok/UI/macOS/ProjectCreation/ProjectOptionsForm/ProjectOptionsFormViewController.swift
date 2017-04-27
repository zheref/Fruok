//
//  ProjectOptionsFormViewController.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa
import Bond

protocol ProjectOptionsFormViewControllerProtocol : ViewControllerProtocol {
    
    var parentVC: ProjectCreationContainerViewControllerProtocol? { get set }
    
    func cancelByDismissing()
    
    func changeToProjectTypeSelection()
    
}


class ProjectOptionsFormViewController: NSViewController, ProjectOptionsFormViewControllerProtocol {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var codenameTextField: NSTextField!
    @IBOutlet weak var commercialNameTextField: NSTextField!
    @IBOutlet weak var durationTextField: NSTextField!
    @IBOutlet weak var deadlineDatePicker: NSDatePicker!
    @IBOutlet weak var clientComboBox: NSComboBox!
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        vm.ready()
    }
    
    // MARK: - PROJECTTYPESELECTIONVIEWCONTROLLER PROTOCOL
    
    var vm: ViewControllerModelProtocol = ProjectOptionsFormViewModel() {
        didSet {
            if let vm = vm as? ProjectOptionsFormViewModelProtocol {
                vm.codename.bidirectionalBind(to: codenameTextField.reactive.editingString)
                vm.commercialName.bidirectionalBind(to: commercialNameTextField.reactive.editingString)
                
                vm.duration
                    .map({ "\($0) days" })
                    .bind(to: durationTextField)
                
                //vm.deadline.bidirectionalBind(to: deadlineDatePicker.reactive.)
                
                vm.deadline
                    .map({ $0.americanString })
                    .bind(to: deadlineDatePicker)
                
                
                
                
//                durationTextField.reactive.editingString
//                    .map { $0 + " days" }
//                    .bind(to: clientComboBox)
                
            }
        }
    }
    
    var model: ProjectOptionsFormViewModelProtocol {
        return vm as! ProjectOptionsFormViewModelProtocol
    }
    
    var parentVC: ProjectCreationContainerViewControllerProtocol?
    
    
    func cancelByDismissing() {
        parentVC?.cancelByDismissingWindow()
    }
    
    
    func changeToProjectTypeSelection() {
        parentVC?.presentProjectTypeSelection(withNextVM: model)
    }
    
    // MARK: - ACTIONS
    
    @IBAction func userDidClickCancel(_ sender: Any) {
        model.userDidCancel()
    }
    
    
    @IBAction func userDidClickPrevious(_ sender: Any) {
        model.userWillingPrevious()
    }
    
    @IBAction func userDidChangeText(_ sender: NSTextField) {
        
    }
    
    
}
