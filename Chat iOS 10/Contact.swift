//
//  Contact.swift
//  Chat iOS 10
//
//  Created by Vladimir Valter on 24/01/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import Foundation

class Contact {
    
    private var _name = ""
    private var _id = ""
    
    init(id: String, name: String) {
        _id = id
        _name = name
        
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var id: String {
        return _id
        
    }
    
    
}






























