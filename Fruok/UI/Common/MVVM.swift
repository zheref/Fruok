//
//  MVVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

// MARK: - VIEW RELATED

public enum DisplayDestination {
    case intoNewWindow
    case intoSameView
    case intoPanel
    case intoSheet
}

public protocol ViewModelProtocol : class {
    
    weak var view: ViewProtocol? { get set }
    
    func ready()
    
}

public protocol ViewModelRepresentant {
    
    var vm: ViewModelProtocol? { get set }
    
}

public protocol ViewProtocol : class, ViewModelRepresentant {
    
}

// MARK: - VIEW CONTROLLER RELATED

public protocol ViewControllerModelProtocol : class {
    
    var persistanceReady: Bool { get set }
    
    weak var vc: ViewControllerProtocol? { get set }
    
    func ready()
    
    func persistIfNeeded()
    
}

public protocol ViewControllerModelRepresentant {
 
    var vm: ViewControllerModelProtocol { get set }
    
}

public protocol ViewControllerProtocol : class, ViewControllerModelRepresentant {
    
    var view: NSView { get set }
    
    var window: WindowControllerProtocol? { get }
    
    func closeMyWindow()
    
}

extension ViewControllerProtocol {
    
    var window: WindowControllerProtocol? {
        return view.window?.windowController as? WindowControllerProtocol
    }
    
}

public protocol ViewControllerLifecycleDelegate : class {
    
    func presentedViewDidAppear()
    
}

public protocol WindowControllerProtocol : ViewControllerLifecycleDelegate {
    
    var doc: DocumentProtocol? { get }
    
    func presentSheet(forModule module: ModuleProtocol)
    
    func dismissSheet(forModule module: ModuleProtocol)
    
    func close()
    
    func dismissAsSheet()
    
}

public protocol DocumentProtocol {
    
    var existsOnDisk: Bool { get }
    
    func saveByDisplayingPathPicker(sender: Any?)
    
}

public protocol ModuleProtocol {
    
    var wc: NSWindowController { get set }
    
}
