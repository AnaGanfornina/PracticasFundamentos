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
    private var playlistSelected: Playlist
    private var isFavorite: Bool = false
    
    
    
    // MARK: - Initializer
    init(playlistSelected: Playlist, isFavorite: Bool) {
        
        self.playlistSelected = playlistSelected
        self.isFavorite = isFavorite

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
        //Crear un botón para lanzar la reproducción
        
       
        //navigationItem.rightBarButtonItem = UIBarButtonItem
        
        
        
        // Titulo de la playlist seleccionada
        //title = playlistSelected?.title
        
        // Registrar la celda
        
        let registration = UICollectionView.CellRegistration<PlaylistDetailCollectionViewCell,Song>(cellNib: UINib(nibName: PlaylistDetailCollectionViewCell.identifier, bundle: nil)) { cell, _, song in
            cell.configure(with: song)
        }
        
        // crear la fuente de datos que vamos a representar
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, song in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: song)
        }
        
        // Asignamos la fuente de datos al collection View
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self // FIXME: No entiendo bien esto
        
        // Creacion de snapshot
        
        var snapshot = Snapshot()
        snapshot.appendSections([.playlistSongs])
        
        snapshot.appendItems(playlistSelected.songs)
        
        //y añadirlo a la fuente de datos
        
        dataSource?.apply(snapshot)
        
        //Añadir el botón de favoritos en el navigationBar
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(
            image: isFavorite
            ? UIImage(systemName: "star.fill") // TODO: esto lo podemos refacrizar sacandolo a una función externa
            : UIImage(systemName: "star"),
            // Es como un IBActon
            primaryAction: UIAction { [weak self] _ in
                guard let self else { return }  // si self aún sigue en memoria continua
                // y modifica el icono de estrella
                self.isFavorite.toggle()
                self.navigationItem.rightBarButtonItem?.image = self.isFavorite
                ? UIImage(systemName: "star.fill")
                : UIImage(systemName: "star")
                
                
                
                // Mandamos la invormacion al observer
                NotificationCenter.default.post(
                    name: NSNotification.Name("didToggleFavorite"), // por el canal con identificado "x" vamos a obtener la información
                    object: self, // EL objeto que está enviando la información
                    userInfo: ["favoritePlaylist" : playlistSelected])
            }

        )
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
        return CGSize(width: width, height: 100)
    }
    
}
