//
//  BookshelfViewController.swift
//  BooksApp
//
//  Created by Yuliya on 07/11/2023.
//

import Foundation
import UIKit

final class BookshelfViewController: UIViewController {

    var presenter: BookshelfPresenterProtocol?
    
    private let shelfCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let forEmptyStateCustomView = EmptyStateCustomView()

    private var shelfData: [BookshelfViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Primary.background
        
        shelfData.isEmpty ? setupImageView() : setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(shelfCollectionView)
        shelfCollectionView.delegate = self
        shelfCollectionView.dataSource = self
        shelfCollectionView.register(BookshelfCollectionViewCell.self,
                                     forCellWithReuseIdentifier: BookshelfCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            shelfCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            shelfCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shelfCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shelfCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupImageView() {
        view.addSubview(forEmptyStateCustomView)

        NSLayoutConstraint.activate([
            forEmptyStateCustomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forEmptyStateCustomView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            forEmptyStateCustomView.widthAnchor.constraint(equalToConstant: 300),
            forEmptyStateCustomView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }

    func set(_ presenter: BookshelfPresenterProtocol) {
        self.presenter = presenter
    }
}

extension BookshelfViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shelfData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookshelfCollectionViewCell.identifier, for: indexPath) as? BookshelfCollectionViewCell else { return UICollectionViewCell() }
        cell.set(shelfData[indexPath.item])
        return cell
    }
}

extension BookshelfViewController: UICollectionViewDelegate{

}

extension BookshelfViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        let item = shelfData[indexPath.item]
        return BookshelfCollectionViewCell.size(for: item, containerSize: frame.size)
    }
}

extension BookshelfViewController: BookshelfViewProtocol {
    func show(_ items: [BookshelfViewModel]) {
        self.shelfData = items
    }
    
    func setEmpty(data: EmptyStateCustomViewModel) {
        self.forEmptyStateCustomView.set(data)
    }
}
