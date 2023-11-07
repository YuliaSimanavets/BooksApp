//
//  UIView.swift
//  BooksApp
//
//  Created by Yuliya on 03/11/2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        addSubviews(views)
    }

    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
