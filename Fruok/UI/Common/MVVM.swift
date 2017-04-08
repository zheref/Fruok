//
//  MVVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

public protocol ViewModelProtocol : class {
    
    weak var vc: ViewControllerProtocol? { get set }
    
    func ready()
    
}

public protocol ViewControllerProtocol : class {
    
    var vm: ViewModelProtocol { get set }
    
    var window: WindowControllerProtocol? { get }
    
}

public protocol ViewControllerLifecycleDelegate : class {
    
    func presentedViewDidAppear()
    
}

public protocol WindowControllerProtocol : ViewControllerLifecycleDelegate {
    
    var doc: DocumentProtocol? { get }
    
    func presentSheet(forModule module: ModuleProtocol)
    
}

public protocol DocumentProtocol {
    
    var existsOnDisk: Bool { get }
    
}

public protocol ModuleProtocol {
    
    var wc: NSWindowController { get set }
    
}
