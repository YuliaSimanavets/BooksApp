//
//  ModuleBuilder.swift
//  PokemonApplication
//
//  Created by Yuliya on 12/04/2023.
//

import UIKit

final class ModuleBuilder {
    
    static func createSearchScreenModule() -> UIViewController {
        let view = SearchScreenViewController()
        let dataManager = DataManager()
        let presenter = SearchScreenPresenter(view: view,
                                              dataManager: dataManager)
        view.set(presenter)
        return view
    }
    
    static func createPlusScreenModule() -> UIViewController {
        let view = PlusScreenViewController()
        let presenter = PlusScreenPresenter(view: view)
        view.set(presenter)
        return view
    }
}
