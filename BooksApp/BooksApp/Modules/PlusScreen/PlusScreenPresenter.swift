//
//  PlusScreenPresenter.swift
//  BooksApp
//
//  Created by Yuliya on 17/11/2023.
//

import Foundation
import UIKit

protocol PlusScreenViewProtocol: AnyObject {

}

protocol PlusScreenPresenterProtocol {

}

class PlusScreenPresenter: PlusScreenPresenterProtocol {
    
    weak var view: PlusScreenViewProtocol?

    init(view: PlusScreenViewProtocol) {
        self.view = view
    }

}
