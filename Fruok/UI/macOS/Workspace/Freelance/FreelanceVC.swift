//
//  FreelanceVC.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 5/29/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa


protocol FreelanceViewControllerProtocol : ViewControllerProtocol {
    
    func refreshUI()
    
}


class FreelanceViewController : NSViewController, FreelanceViewControllerProtocol {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    // MARK: - FreelanceViewControllerProtocol
    
    var vm: ViewControllerModelProtocol = FreelanceViewModel()
    
    
    func closeMyWindow() {
        
    }
    
    
    func refreshUI() {
        
        
    }

    
}
