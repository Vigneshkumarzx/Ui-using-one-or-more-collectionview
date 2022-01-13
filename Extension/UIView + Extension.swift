//
//  UIView + Extension.swift
//  Task
//
//  Created by vignesh kumar c on 11/01/22.
//

import Foundation
import UIKit

extension UIView {
  @IBInspectable  var cornerRadius: CGFloat {
        get {
            return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
