//
//  BookshelfPresenter.swift
//  BooksApp
//
//  Created by Yuliya on 17/11/2023.
//

import Foundation
import UIKit

protocol BookshelfViewProtocol: AnyObject {
    func show(_ items: [BookshelfViewModel])
    func setEmpty(data: EmptyStateCustomViewModel)
}

protocol BookshelfPresenterProtocol {
    
}

class BookshelfPresenter: BookshelfPresenterProtocol {
    
    weak var view: BookshelfViewProtocol?
    
    init(view: BookshelfViewProtocol) {
        self.view = view
        showEmptyState()
        showBookshelf()
    }
    
    private func showBookshelf() {
        let items: [BookshelfViewModel] = [
            .init(image: UIImage(named: ""), name: "First book", url: ""),
            .init(image: UIImage(named: ""), name: "Second book", url: ""),
            .init(image: UIImage(named: ""), name: "Third book", url: ""),
        ]
        
        view?.show(items)
    }
    
    private func showEmptyState() {
        let customView = EmptyStateCustomViewModel(image: UIImage(named: "emptyShelf"), generalText: "Your shelf is empty yet. Please add your author or book.")
        view?.setEmpty(data: customView)
    }
}
