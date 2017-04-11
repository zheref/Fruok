//
//  KUI.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/6/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

class KUI {
    
    enum Storyboard : String {
        case Workspace
        case ProjectCreation
    }
    
    enum WindowController : String {
        case Workspace
        case ProjectCreation
    }
    
    enum ViewController : String {
        case ProjectCreationContainer
        case ProjectTypeSelection
        case ProjectOptionsForm
    }
    
    enum Segue : String {
        case ProjectTypeSelectionToProjectOptionsForm
    }
    
}
