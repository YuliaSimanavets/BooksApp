//
//  OnboardingCollectionViewCell.swift
//  BooksApp
//
//  Created by Yuliya on 03/11/2023.
//

import Foundation
import UIKit

struct OnboardingCellViewModel {
//    let image: UIImage?
    let title: String
    let subtitle: String
}

final class OnboardingCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier: String {
        return String(describing: OnboardingCollectionViewCell.self)
    }
    
    private let generalImageView = UIImageView.new {
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel.new {
        $0.numberOfLines = 0
    }
    
    private let subtitleLabel = UILabel.new {
        $0.numberOfLines = 0
    }

    override func setupView() {
        super.setupView()
        contentView.addSubviews(titleLabel, subtitleLabel)
        contentView.backgroundColor = UIColor.Primary.main
        setupConstraints()
//        generalImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            generalImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            generalImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UI.sizes.offset),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    func setup(with data: OnboardingCellViewModel) {
        //        generalImageView.image = data.image
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attributedStringTitle = NSMutableAttributedString(string: data.title,
                                                              attributes: [
                                                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .heavy),
                                                                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                                NSAttributedString.Key.foregroundColor: UIColor.Primary.title
                                                              ])
        titleLabel.attributedText = attributedStringTitle
        titleLabel.textAlignment = .center
        let attributedStringSubtitle = NSMutableAttributedString(string: data.subtitle,
                                                                 attributes: [
                                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                                    NSAttributedString.Key.foregroundColor: UIColor.Primary.subtitle
                                                                 ])
        subtitleLabel.attributedText = attributedStringSubtitle
        subtitleLabel.textAlignment = .center
    }
    
    static func size(for data: OnboardingCellViewModel, containerSize: CGSize) -> CGSize {
        return .init(width: containerSize.width, height: containerSize.height)
    }
}
