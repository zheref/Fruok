//
//  ProjectTypeCollectionItemViewModel.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/9/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

class ProjectTypeCollectionItemViewModel : ViewModelProtocol {
    
    private var projectType: ProjectType
    
    var imageAssetName: String? {
        return projectType.relImageUrl
    }
    
    var title: String {
        return projectType.title
    }
    
    weak public var view: ViewProtocol?
    
    init(withModel projectType: ProjectType) {
        self.projectType = projectType
    }
    
    func ready() {
        
    }
    
}
