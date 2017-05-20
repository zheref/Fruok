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
    
    func bringUpPathPickerForSaving()
    
}


class ProjectOptionsFormViewController: NSViewController, ProjectOptionsFormViewControllerProtocol {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var codenameTextField: NSTextField!
    @IBOutlet weak var commercialNameTextField: NSTextField!
    @IBOutlet weak var durationTextField: NSTextField!
    @IBOutlet weak var durationStepper: NSStepper!
    @IBOutlet weak var deadlineDatePicker: NSDatePicker!
    @IBOutlet weak var clientComboBox: NSComboBox!
    
    // MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.vc = self
        
        bind()
        
        vm.ready()
    }
    
    func bind() {
        guard let vm = vm as? ProjectOptionsFormViewModelProtocol else {
            return
        }
        
        vm.codename.bidirectionalBind(to: codenameTextField.reactive.editingString)
        vm.commercialName.bidirectionalBind(to: commercialNameTextField.reactive.editingString)
        
        vm.duration
            .map({ "\($0) days" })
            .bind(to: durationTextField)
        
        //durationStepper.
        
        vm.deadline
            .map({ $0.americanString })
            .bind(to: deadlineDatePicker)
    }
    
    func updateModel() {
        model.codename.value = codenameTextField.cell?.title ?? ""
    }
    
    // MARK: WorkspaceCanvasViewControllerProtocol
    
    func closeMyWindow() {
        window?.close()
    }
    
    // MARK: - PROJECTTYPESELECTIONVIEWCONTROLLER PROTOCOL
    
    var vm: ViewControllerModelProtocol = ProjectOptionsFormViewModel()
    
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
    
    func bringUpPathPickerForSaving() {
        parentVC?.completeSaveProcess(withCurrentVM: model)
    }
    
    // MARK: - ACTIONS
    
    @IBAction func userDidClickCancel(_ sender: Any) {
        model.userDidCancel()
    }
    
    
    @IBAction func userDidClickPrevious(_ sender: Any) {
        model.userWillingPrevious()
    }
    
    
    @IBAction func userDidClickNext(_ sender: Any) {
        model.userWillingToFinishSave()
    }
    
    
    @IBAction func userDidChangeText(_ sender: NSTextField) {
        
    }
    
    
    @IBAction func userDidChangeDurationStepper(_ sender: NSStepper) {
        //sender.
    }
}
