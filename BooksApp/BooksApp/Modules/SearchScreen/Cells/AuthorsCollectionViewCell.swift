//
//  AuthorsCollectionViewCell.swift
//  BooksApp
//
//  Created by Yuliya on 08/11/2023.
//

import Foundation
import UIKit

struct AuthorCellViewModel {
    let photo: UIImage?
    let name: String
}

class AuthorsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: AuthorsCollectionViewCell.self)
    }
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Primary.title
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = .clear
        addSubviews(photoImageView, nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            photoImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            photoImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setup(with data: AuthorCellViewModel) {
        photoImageView.image = data.photo
        nameLabel.text = data.name
    }
    
    static func size(for data: AuthorCellViewModel, containerSize: CGSize) -> CGSize {
        let height = 10 * 3 + 50 + 20
        return .init(width: containerSize.width, height: CGFloat(height))
    }
}
