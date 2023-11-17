//
//  TabBarViewController.swift
//  BooksApp
//
//  Created by Yuliya on 07/11/2023.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookshelf = BookshelfViewController()
        let searchScreen = ModuleBuilder.createSearchScreenModule()
        let settings = UINavigationController(rootViewController: SettingsViewController())
        
        let plusScreen = ModuleBuilder.createPlusScreenModule()
        
        self.setViewControllers([bookshelf, searchScreen, plusScreen, settings], animated: false)
       
        guard let items = tabBar.items else { return }
        
        let images = ["books.vertical.fill", "magnifyingglass.circle.fill", "plus.circle", "gearshape.fill"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = UIColor.Primary.background
        tabBar.tintColor = .black
    }
}
