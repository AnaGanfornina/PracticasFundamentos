//
//  PlaylistDetailCollectionViewController.swift
//  SpotyClone
//
//  Created by Ana on 2/3/25.
//

import UIKit

enum PlaylistSectionDetail {
    case playlistSongs
}

final class PlaylistDetailCollectionViewController: UICollectionViewController {
    
    // MARK: - DataSource
    
    typealias DataSource = UICollectionViewDiffableDataSource<PlaylistSectionDetail, Song>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PlaylistSectionDetail, Song>
    
    // MARK: - Data
    private var dataSource: DataSource?

    var songs: [Song]?
    
    
    
    // MARK: - Initializer
    init() {

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Registrar la celda
        
        let registration = UICollectionView.CellRegistration<PlaylistDetailCollectionViewCell,Song>(cellNib: UINib(nibName: "PlaylistDetailCollectionViewCell", bundle: nil)) { cell, _, song in
            cell.configure(with: song)
        }
        
        // crear la fuente de datos que vamos a representar
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, song in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: song)
        }
        
        // Asignamos la fuente de datos al collection View
        
        collectionView.dataSource = dataSource
        
        // Creacion de snapshot
        
        var snapshot = Snapshot()
        snapshot.appendSections([.playlistSongs])
        guard let songs = songs else { return }
        snapshot.appendItems(songs)
        
        //y añadirlo a la fuente de datos
        
        dataSource?.apply(snapshot)
    }
}

// MARK: - CollectionViewLayout

extension PlaylistDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let columNumber: CGFloat = 1
        let width = (collectionView.frame.size.width - 32) / columNumber
        return CGSize(width: width, height: 70)
    }
    
}
