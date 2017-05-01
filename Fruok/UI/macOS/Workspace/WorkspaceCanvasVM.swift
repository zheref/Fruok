//
//  WorkspaceCanvasViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


public protocol WorkspaceCanvasViewModelProtocol : ViewControllerModelProtocol {
    
    var items: [WorkspaceSourceListItemVM] { get }
    
}


public class WorkspaceCanvasViewModel : WorkspaceCanvasViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    public lazy var items: [WorkspaceSourceListItemVM] = {
        var items = [WorkspaceSourceListItemVM]()
        
        // TODO: This should be read from project XML
        
        //let projectName = document.project?.name ?? "Project Name"
        
        items.append(WorkspaceSourceListItemVM(withTitle: "",
                                               icon: .project,
                                               destination: .ProjectConfig))
        
        return items
    }()
    
    // MARK: - COMPUTED PROPERTIES
    
    // UNSAFE!
    // TODO: IMPROVE THIS
    var document: Document {
        return vc!.window!.doc! as! Document
    }
    
    
    var ui: WorkspaceCanvasViewControllerProtocol? {
        return vc as? WorkspaceCanvasViewControllerProtocol
    }
    
    
    // MARK: - WorkspaceCanvasViewModelProtocol
    
    weak public var vc: ViewControllerProtocol?
    
    
    public func ready() {
        guard let document = vc?.window?.doc else {
            return
        }
        
        if !document.existsOnDisk {
            startProjectCreationFlow()
        } else {
            updateProjectName()
            ui?.reloadSourceListData()
        }
    }
    
    
    // MARK: - INSTANCE METHODS

    fileprivate func startProjectCreationFlow() {
        // TODO: IMPROVE
        ui?.window?.presentSheet(forModule: Wireframe.requestProjectCreation(withDelegate: self))
    }
    
    
    private func updateProjectName() {
        for item in items {
            if item.collapsedIcon == .project {
                item.title = document.project?.name ?? ""
            }
        }
    }
    
}


extension WorkspaceCanvasViewModel : ProjectCreationCompletionDelegate {
    
    
    func projectCreationDidFail(becauseOf error: Error) {
        
    }
    
    
    func userDidCancelProjectCreation() {
        ui?.closeMyWindow()
    }
    
    
    func userDidCompleteProjectCreation(
        withCompletionVM completionVM: ProjectCreationContainerViewModel) {
        
        document.project = Project(with: completionVM)
        
        document.save(to: completionVM.urlToSave!, ofType: "fruok", for: .saveAsOperation) { (error) in
            // TODO: HANDLE ERROR
        }
    }
    
    
}
