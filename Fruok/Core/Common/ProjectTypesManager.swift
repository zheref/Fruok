//
//  ProjectTypesManager.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

class ProjectTypesManager {
    
    static var shared: ProjectTypesManager = {
        return ProjectTypesManager()
    }()
    
    func readProjectTypes(returner: ProjectTypesReturner) {
        let projectType = ProjectType(id: "software", relImageUrl: "ProjectTypeSoftware", title: "Software Project")
        let projectTypes = [projectType]
        returner(projectTypes)
    }
    
}
