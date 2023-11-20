//
//  BookshelfCollectionViewCell.swift
//  BooksApp
//
//  Created by Yuliya on 17/11/2023.
//

import Foundation
import UIKit

struct BookshelfViewModel {
    let image: UIImage?
    let name: String
    let url: String
}

class BookshelfCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: BookshelfCollectionViewCell.self)
    }
    
    private enum Offset: CGFloat {
        case offset = 10
    }
    
    private let characterNameLabel = UILabel.new {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = UIColor.Primary.title
        $0.textAlignment = .center
    }
    
//    MARK: - will change
    private let characterImageView = UIImageView.new {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    override func setupView() {
        super.setupView()
        backgroundColor = UIColor.Primary.lightButton
        layer.cornerRadius = 10
        
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: Offset.offset.rawValue),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Offset.offset.rawValue),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Offset.offset.rawValue),
            characterImageView.heightAnchor.constraint(equalToConstant: 140),
            characterImageView.widthAnchor.constraint(equalToConstant: 140),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: Offset.offset.rawValue * 2),
            characterNameLabel.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(_ data: BookshelfViewModel) {
        characterImageView.image = data.image
        characterNameLabel.text = data.name
    }
    
    static func size(for data: BookshelfViewModel, containerSize: CGSize) -> CGSize {
        let cellHeight: CGFloat = 140 + 20 + Offset.offset.rawValue * 5
        return .init(width: containerSize.width / 2 - CGFloat(10), height: cellHeight)
    }
}
