//
//  ProjectCreationCompletionDelegate.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

protocol ProjectCreationCompletionDelegate : FXMLPermissioned {
    
    func projectCreationDidFail(becauseOf error: Error)
    
    func userDidCancelProjectCreation()
    
    func userDidCompleteProjectCreation(
        withCompletionVM completionVM: ProjectCreationContainerViewModel)
    
}
