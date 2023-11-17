//
//  PlusScreenViewController.swift
//  BooksApp
//
//  Created by Yuliya on 17/11/2023.
//

import Foundation
import UIKit

class PlusScreenViewController: UIViewController {
    
    var presenter: PlusScreenPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Primary.background
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func set(_ presenter: PlusScreenPresenterProtocol) {
        self.presenter = presenter
    }
}

extension PlusScreenViewController: PlusScreenViewProtocol {
    
}
