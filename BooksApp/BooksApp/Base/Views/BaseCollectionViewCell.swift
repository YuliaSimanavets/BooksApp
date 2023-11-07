//
//  BaseCollectionViewCell.swift
//  BooksApp
//
//  Created by Yuliya on 03/11/2023.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
//    var cancellables = [AnyCancellable]()
    
    let containerView = UIView.new {
        $0.backgroundColor = .clear
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    override public required init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

//        cancellables = [AnyCancellable]()
    }

    override open class var requiresConstraintBasedLayout: Bool {
        return true
    }

    func setupView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}
