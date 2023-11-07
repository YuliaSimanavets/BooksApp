//
//  OnboardingViewController.swift
//  BooksApp
//
//  Created by Yuliya on 03/11/2023.
//

import UIKit

final class OnboardingViewController: UIViewController {

    private let onboardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let onboardingItems: [OnboardingCellViewModel] = [
        .init(title: "Hi", subtitle: "friend"),
        .init(title: "Continue", subtitle: "next"),
        .init(title: "Bye", subtitle: "dud")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Primary.background
        
        setupCollectionView()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            onboardingCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            onboardingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingCollectionView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(onboardingCollectionView)
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: onboardingItems[indexPath.item])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegate {

}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        return OnboardingCollectionViewCell.size(for: onboardingItems[indexPath.item], containerSize: frame.size)
    }
}
