//
//  DetailViewController.swift
//  EventAppProject
//
//  Created by Mindy Douglas on 11/19/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recommendationsCell = RecommendationsCell()
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
                
            case .detailHeaderLg:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .absolute(20))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                                                        
            case .detailHeader:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .fractionalHeight(16))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .join:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .fractionalHeight(48))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .similar:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(212))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .about:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(372), heightDimension: .fractionalHeight(355))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 15)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .location:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .fractionalHeight(264))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 10, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .recommendations:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(325), heightDimension: .absolute(207))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .article:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .fractionalHeight(264))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            case .image:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(327), heightDimension: .fractionalHeight(549))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                return section
                
            default:
                return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
//        recommendationsCell.setupViewsCornerRadius()
        setupCollectionView()
        configureDataSource()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "DetailHeaderLgCell", bundle: .main), forCellWithReuseIdentifier: "DetailHeaderLgCell")
        collectionView.register(UINib(nibName: "DetailHeaderCell", bundle: .main), forCellWithReuseIdentifier: "DetailHeaderCell")
        collectionView.register(UINib(nibName: "JoinCell", bundle: .main), forCellWithReuseIdentifier: "JoinCell")
        collectionView.register(UINib(nibName: "SimilarCell", bundle: .main), forCellWithReuseIdentifier: "SimilarCell")
        collectionView.register(UINib(nibName: "AboutCell", bundle: .main), forCellWithReuseIdentifier: "AboutCell")
        collectionView.register(UINib(nibName: "LocationCell", bundle: .main), forCellWithReuseIdentifier: "LocationCell")
        collectionView.register(UINib(nibName: "RecommendationsCell", bundle: .main), forCellWithReuseIdentifier: "RecommendationsCell")
        collectionView.register(UINib(nibName: "ArticleCell", bundle: .main), forCellWithReuseIdentifier: "ArticleCell")
        collectionView.register(UINib(nibName: "ImageCell", bundle: .main), forCellWithReuseIdentifier: "ImageCell")
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            [weak self] (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .detailHeaderLg:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderLgCell", for: indexPath)
                return cell
            case .detailHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailHeaderCell", for: indexPath)
                return cell
            case .join:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoinCell", for: indexPath)
                return cell
            case .similar:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCell", for: indexPath)
                return cell
            case .about:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutCell", for: indexPath)
                return cell
            case .location:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath)
                return cell
            case .recommendations:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationsCell", for: indexPath)
                return cell
            case .article:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath)
                return cell
            case .image:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
                return cell
            default: return nil
            }
        }
        let sections = [
            Section(type: .image, items: [ Item() ]),
          
     
        ]
//        let sections = [
//            Section(type: .image, items: [ Item() ]),
//            Section(type: .article, items: [
//            Item()
//            ]),
//            Section(type: .detailHeader, items: [ Item() ]),
//            Section(type: .recommendations, items: [ Item() ]),
//            Section(type: .detailHeaderLg, items: [
//            Item()
//            ]),
//            Section(type: .location, items: [
//            Item()
//            ]),
//            Section(type: .detailHeaderLg, items: [
//            Item()
//            ]),
//            Section(type: .about, items: [
//            Item()
//            ]),
//            Section(type: .detailHeader, items: [
//            Item()
//            ]),
//            Section(type: .similar, items: [
//            Item(), Item(), Item(), Item(), Item()
//            ]),
//            Section(type: .join, items: [
//            Item()
//            ]),
//        ]
//
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach {snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
