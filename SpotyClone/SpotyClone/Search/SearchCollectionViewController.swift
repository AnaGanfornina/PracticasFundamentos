//
//  SearchCollectionViewController.swift
//  SpotyClone
//
//  Created by Ana on 28/2/25.
//

import UIKit

enum SearchSection {
    case genres
}

final class SearchCollectionViewController: UICollectionViewController {
    
    // MARK: - DataSource
    
    typealias DataSource = UICollectionViewDiffableDataSource<SearchSection,Genre>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SearchSection,Genre>
    
    // MARK: - Data
    private let genres: [Genre]
    private var dataSource: DataSource?
    
    
    // MARK: - Initializer
    init() {
        self.genres = GenresLocalRepository.allGenres
        
        let layout = UICollectionViewFlowLayout()
        //nos da los espacio entre esas celdas
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: - Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registrar la celda
        
        let registration  = UICollectionView.CellRegistration<SearchCollectionViewCell, Genre>(cellNib: UINib(nibName: "SearchCollectionViewCell", bundle: nil)) { cell, _, genre in
            cell.configure(with: genre)
        }
        // Crear la fuente de datos que vamos a representar en la tabla

        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, genre in
            collectionView.dequeueConfiguredReusableCell(
                using: registration,
                for: indexPath,
                item: genre)
        }
        
        // Asignamos la fuente de datos al collectionView
        
        collectionView.dataSource = dataSource
        
        //Creacion de snapshot
        
        var snapshot = Snapshot()
        snapshot.appendSections([.genres])
        snapshot.appendItems(genres)
        
        // y añadirlo a la fuente de datos
        
        dataSource?.apply(snapshot)
        
    }

}

// MARK: - CollectionViewLayout

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let columNumber: CGFloat = 2
        let width = (collectionView.frame.size.width - 32) / columNumber
        return CGSize(width: width, height: 125)
    }
    
}
