//
//  Globals.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/8/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Foundation

typealias Callback = () -> Void
typealias ErrorHandler = (Error) -> Void

typealias ProjectTypesReturner = ([ProjectType]) -> Void

extension Date {
    
    var americanString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"
        return dateFormatter.string(from: self)
    }
    
}
