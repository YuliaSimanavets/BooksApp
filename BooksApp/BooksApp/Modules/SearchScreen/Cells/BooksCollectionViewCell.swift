//
//  BooksCollectionViewCell.swift
//  BooksApp
//
//  Created by Yuliya on 08/11/2023.
//

import Foundation
import UIKit

struct BookCellViewModel {
    let bookImage: UIImage?
    let bookTitle: String
    let bookAuthor: String
}

class BooksCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: BooksCollectionViewCell.self)
    }
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.Primary.pageControl
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Primary.title
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = .lightGray
        addSubviews(bookImageView, nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bookImageView.heightAnchor.constraint(equalToConstant: 100),
            bookImageView.widthAnchor.constraint(equalToConstant: 100),
            bookImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            nameLabel.centerYAnchor.constraint(equalTo: bookImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setup(with data: BookCellViewModel) {
        bookImageView.image = data.bookImage
        nameLabel.text = data.bookTitle
    }
    
    static func size(for data: BookCellViewModel, containerSize: CGSize) -> CGSize {
        let height = 10 * 3 + 140 + 20
        return .init(width: containerSize.width, height: CGFloat(height))
    }
}
