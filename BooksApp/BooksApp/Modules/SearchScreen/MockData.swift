//
//  MockData.swift
//  BooksApp
//
//  Created by Yuliya on 07/11/2023.
//

import Foundation
import UIKit

struct MockData {
    
    static let shared = MockData()
    
    private let authors: SearchScreenSection = {
        .authors([
            .init(id: "", name: "Bulgakov"),
            .init(id: "", name: "Tolstoy"),
            .init(id: "", name: "Ahmatova")
//            .init(photo: UIImage(named: "1"), name: "Bulgakov"),
//            .init(photo: UIImage(named: "2"), name: "Tolstoy"),
//            .init(photo: UIImage(named: "3"), name: "Ahmatova")
        ])
    }()
    private let books: SearchScreenSection = {
        .books([
//            .init(bookImage: UIImage(named: "1"), bookTitle: "Bulgakov", bookAuthor: ""),
//            .init(bookImage: UIImage(named: "2"), bookTitle: "Tolstoy", bookAuthor: ""),
//            .init(bookImage: UIImage(named: "3"), bookTitle: "Ahmatova", bookAuthor: "")
        ])
    }()

    var pageData: [SearchScreenSection] {
        [authors, books]
    }
}
