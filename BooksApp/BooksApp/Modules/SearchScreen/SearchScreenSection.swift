//
//  SearchScreenSection.swift
//  BooksApp
//
//  Created by Yuliya on 07/11/2023.
//

import Foundation
import UIKit

enum SearchScreenSection {
    case authors([AuthorViewModel])
    case books([BookViewModel])
    
    var items: [Any] {
        switch self {
        case .authors(let authors):
            return authors
        case .books(let books):
            return books
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .authors(_):
            return "Authors"
        case .books(_):
            return "Books"
        }
    }
}
