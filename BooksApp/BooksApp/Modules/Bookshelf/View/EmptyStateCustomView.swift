//
//  EmptyStateCustomView.swift
//  BooksApp
//
//  Created by Yuliya on 20/11/2023.
//

import Foundation
import UIKit

struct EmptyStateCustomViewModel {
    let image: UIImage?
    let generalText: String
}

class EmptyStateCustomView: UIView {

    private enum Offset: CGFloat {
        case offset = 10
    }
    
    private var generalLabel = UILabel.new {
        $0.font = .systemFont(ofSize: 24)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let imageView = UIImageView.new {
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFit
    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(generalLabel)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Offset.offset.rawValue),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Offset.offset.rawValue),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Offset.offset.rawValue),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            generalLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Offset.offset.rawValue),
            generalLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            generalLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            generalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Offset.offset.rawValue)
        ])
    }
    
    func set(_ data: EmptyStateCustomViewModel) {
        imageView.image = data.image
        generalLabel.text = data.generalText
    }
}
