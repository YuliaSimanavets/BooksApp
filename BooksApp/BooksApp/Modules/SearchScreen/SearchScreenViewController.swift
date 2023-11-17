//
//  SearchScreenViewController.swift
//  BooksApp
//
//  Created by Yuliya on 07/11/2023.
//

import Foundation
import UIKit

final class SearchScreenViewController: UIViewController {
    
    var presenter: SearchScreenPresenterProtocol?
    
    private let collectionView: UICollectionView = {
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
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private let sections = MockData.shared.pageData
    
    private var sections: [SearchScreenSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Primary.background
        collectionView.addSubview(plusButton)
        setupCollectionView()
        setupConstraints()
                
        sections.append(.authors(presenter?.authors ?? []))
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -10),

            plusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AuthorsCollectionViewCell.self,
                                forCellWithReuseIdentifier: AuthorsCollectionViewCell.identifier)
        collectionView.register(BooksCollectionViewCell.self,
                                forCellWithReuseIdentifier: BooksCollectionViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
    }
    
    func set(_ presenter: SearchScreenPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - Create layout
extension SearchScreenViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .authors(_):
                return createAuthorsSection()
            case .books(_):
                return createBooksSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
//        section.supplementariesFollowContentInsets = contentInsets -> Bool -> in createAuthorsSection with false
        return section
    }
    
    private func createAuthorsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.2)),
                                                       subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createBooksSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                       heightDimension: .fractionalHeight(0.2)),
                                                     subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                       heightDimension: .estimated(100)),
                     elementKind: UICollectionView.elementKindSectionHeader,
                     alignment: .top)
    }
}

// MARK: - CollectionViewDelegate
extension SearchScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hi")
    }
}

// MARK: - CollectionViewDataSource
extension SearchScreenViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .authors(let authors):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthorsCollectionViewCell.identifier, for: indexPath) as? AuthorsCollectionViewCell else { return UICollectionViewCell() }
            cell.setup(with: .init(photo: UIImage(named: "\(authors[indexPath.item].id)"), name: authors[indexPath.item].name))
            return cell
        case .books(let books):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as? BooksCollectionViewCell else { return UICollectionViewCell() }
// MARK: - need to change
            cell.setup(with: .init(bookImage: UIImage(named: "\(books[indexPath.item].id)"), bookTitle: books[indexPath.item].bookTitle, bookAuthor: ""))

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: HeaderSupplementaryView.identifier,
                                                                               for: indexPath) as? HeaderSupplementaryView
            else { return UICollectionReusableView() }
            header.setup(with: .init(headerText: sections[indexPath.section].title))
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension SearchScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = collectionView.frame
        switch sections[indexPath.section] {
        case .authors(let item):
            let author: AuthorCellViewModel = .init(photo: UIImage(named: "\(item[indexPath.item].id)"), name: item[indexPath.section].name)
            return AuthorsCollectionViewCell.size(for: author, containerSize: frame.size)
        case .books(let item):
            let book: BookCellViewModel = .init(bookImage: UIImage(named: "\(item[indexPath.item].id)"), bookTitle: item[indexPath.section].bookTitle, bookAuthor: "")
            return BooksCollectionViewCell.size(for: book, containerSize: frame.size)
        }
    }
}

extension SearchScreenViewController: SearchScreenViewProtocol {
    func succes() {
        print("succes")
    }
    
    func failure(error: Error) {
        print("failure")
    }
}
