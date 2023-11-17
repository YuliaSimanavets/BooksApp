//
//  HeaderSupplementaryView.swift
//  BooksApp
//
//  Created by Yuliya on 08/11/2023.
//

import Foundation
import UIKit

struct HeaderViewModel {
    let headerText: String
}

class HeaderSupplementaryView: UICollectionReusableView {
    
    static var identifier: String {
        return String(describing: HeaderSupplementaryView.self)
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Primary.title
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Primary.pageControl
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        addSubview(separatorView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            headerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            separatorView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5),
            separatorView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func setup(with data: HeaderViewModel) {
        headerLabel.text = data.headerText
    }
    
    static func size(for data: HeaderViewModel, containerSize: CGSize) -> CGSize {
        let height = 10 * 2 + 20
        return .init(width: containerSize.width, height: CGFloat(height))
    }
}
