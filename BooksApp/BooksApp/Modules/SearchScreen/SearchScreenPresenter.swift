//
//  SearchScreenPresenter.swift
//  BooksApp
//
//  Created by Yuliya on 10/11/2023.
//

import Foundation
import UIKit

protocol SearchScreenViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol SearchScreenPresenterProtocol {
    func getAuthors()
    func getBooks()
    var authors: [AuthorViewModel]? { get }
//    func getPokemonsFromDB()
//    func loadNextPokemons()
}

class SearchScreenPresenter: SearchScreenPresenterProtocol {
    
    weak var view: SearchScreenViewProtocol?
    private let dataManager: DataManagerProtocol?
//    private let storageManager: StorageManagerProtocol?
//    private let reachability: ReachabilityProtocol?
    
    var authors: [AuthorViewModel]?
    var books: [BookViewModel]?
    
    init(view: SearchScreenViewProtocol,
         dataManager: DataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager

        getAuthors()
    }
    
    func getAuthors() {

        dataManager?.getData(url: "https://pokeapi.co/api/v2/pokemon") { [weak self] users in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch users {
                case .success(let users):
                    self.authors = users?.map({ AuthorViewModel(id: "\($0.url)", name: $0.name) })
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getBooks() {
        
    }
}
