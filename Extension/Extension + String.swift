//
//  Extension + String.swift
//  Task
//
//  Created by vignesh kumar c on 10/01/22.
//

import Foundation

extension String {
    
    
    
    var asUrl: URL? {
        return URL(string: self)
    }
}
