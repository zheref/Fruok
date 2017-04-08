//
//  FruokModule.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa

class FruokModule : ModuleProtocol {
    
    var wc: NSWindowController
    
    init(withWindowController wc: NSWindowController) {
        self.wc = wc
    }
    
}
