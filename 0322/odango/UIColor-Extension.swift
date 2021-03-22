//
//  UIColor-Extension.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
