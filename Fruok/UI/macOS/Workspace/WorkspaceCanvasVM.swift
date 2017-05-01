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
    
    func userDidSelect(item: WorkspaceSourceListItemVM)
    
    var document: Document? { get }
}


public class WorkspaceCanvasViewModel : WorkspaceCanvasViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    public lazy var items: [WorkspaceSourceListItemVM] = {
        var items = [WorkspaceSourceListItemVM]()
        
        // TODO: This should be read from project XML
        
        let projectItem = WorkspaceSourceListItemVM(withTitle: "",
                                                    icon: .project,
                                                    destination: .ProjectConfig)
        
        projectItem.children.append(WorkspaceSourceListItemVM(withTitle: "Freelance",
                                                              icon: .freelance,
                                                              destination: .Freelance))
            
        projectItem.children.append(WorkspaceSourceListItemVM(withTitle: "Client",
                                                              icon: .client,
                                                              destination: .Client))
        
        items.append(projectItem)
        
        
        
        return items
    }()
    
    // MARK: - COMPUTED PROPERTIES
    
    // UNSAFE!
    // TODO: IMPROVE THIS
    public var document: Document? {
        return vc?.window?.doc as? Document
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
    
    
    public func userDidSelect(item: WorkspaceSourceListItemVM) {
        switch item.destination {
        case .ProjectConfig:
            ui?.displayProjectConfig(into: .intoSameView)
        default:
            return
        }
    }
    
    
    // MARK: - INSTANCE METHODS

    fileprivate func startProjectCreationFlow() {
        // TODO: IMPROVE
        ui?.window?.presentSheet(forModule: Wireframe.requestProjectCreation(withDelegate: self))
    }
    
    
    private func updateProjectName() {
        guard let document = document else {
            return
        }
        
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
        
        guard let document = document else {
            return
        }
        
        document.project = Project(with: completionVM)
        
        document.save(to: completionVM.urlToSave!, ofType: "fruok", for: .saveAsOperation) { (error) in
            // TODO: HANDLE ERROR
        }
    }
    
    
}
