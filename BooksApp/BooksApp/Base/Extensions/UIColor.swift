//
//  UIColor.swift
//  BooksApp
//
//  Created by Yuliya on 03/11/2023.
//

import Foundation
import UIKit

public extension UIColor {
    enum Primary {
        static var background: UIColor {
            return "#bbcacc".hexColor
        }
        static var main: UIColor {
            return "#a96d8e".hexColor
        }
        static var title: UIColor {
            return "#000000".hexColor
        }
//        static var title: UIColor {
//            return "#7e3d4a".hexColor
//        }
        static var subtitle: UIColor {
            return "#e2c9c3".hexColor
        }
        static var pageControl: UIColor {
            return "a96d8e".hexColor
        }
        static var separator: UIColor {
            return "a96d8e".hexColor
        }
        static var lightButton: UIColor {
            return "#e0b9ca".hexColor
        }
        static var segmentedControl: UIColor {
            return "#e0b9ca".hexColor
        }
    }
}

extension UIColor {
    var hexString: String {
        let components = self.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
}
