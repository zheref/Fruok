//
//  WorkspaceSourceListItemVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/30/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

public class WorkspaceSourceListItemVM : NSObject, ViewModelProtocol {
    
    // MARK: - SUBTYPES
    
    enum ItemIcon : String {
        case project
        case file
    }
    
    enum Destination {
        case ProjectConfig
    }
    
    // MARK: - PROPERTIES
    
    var title: String
    var collapsedIcon: ItemIcon
    var expandedIcon: ItemIcon?
    var destination: Destination
    
    var children = [WorkspaceSourceListItemVM]()
    
    // MARK: - INITIALIZERS
    
    
    init(withTitle title: String, icon: ItemIcon, destination: Destination) {
        self.title = title
        self.collapsedIcon = icon
        self.destination = destination
    }
    
    
    // MARK: - ViewModelProtocol
    
    public weak var view: ViewProtocol?
    
    public func ready() {
        
    }
    
}
