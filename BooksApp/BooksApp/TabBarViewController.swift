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
        let searchScreen = SearchScreenViewController()
        let settings = UINavigationController(rootViewController: SettingsViewController())
        
        self.setViewControllers([bookshelf, searchScreen, settings], animated: false)
       
        guard let items = tabBar.items else { return }
        
        let images = ["books.vertical.fill", "magnifyingglass.circle.fill", "gearshape.fill"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
