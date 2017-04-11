//
//  ProjectCreationContainerViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/10/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol ProjectCreationContainerViewModelProtocol : ViewControllerModelProtocol {
    
}


class ProjectCreationContainerViewModel : ProjectCreationContainerViewModelProtocol {
    
    weak var vc: ViewControllerProtocol?
    
    var ui: ProjectCreationContainerViewControllerProtocol? {
        return vc as? ProjectCreationContainerViewControllerProtocol
    }
    
    func ready() {
        ui?.presentProjectTypeSelection()
    }
    
}
