//
//  KCore.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

class KCore {
    
    enum PList : String {
        case Info
    }
    
}

protocol FXMLPermissioned {
    
    var fxml: FXMLContent? { get set }
    
}
