//
//  UIVIewController + extension.swift
//  Task
//
//  Created by vignesh kumar c on 11/01/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instatiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
