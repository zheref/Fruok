//
//  FreelanceVM.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/29/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation


protocol FreelanceDelegate : FXMLPermissioned {
    
    
    
}


protocol FreelanceViewModelProtocol : ViewControllerModelProtocol {
    
    var delegate: FreelanceDelegate? { get set }
    
}


class FreelanceViewModel : FreelanceViewModelProtocol {
    
    // MARK: - FreelanceViewModelProtocol
    
    public var persistanceReady = false
    
    weak var vc: ViewControllerProtocol?
    
    var delegate: FreelanceDelegate?
    
    func ready() {
        
    }
    
    func persistIfNeeded() {
        
    }
    
}
