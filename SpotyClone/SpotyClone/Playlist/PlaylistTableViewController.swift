//
//  PlaylistTableViewController.swift
//  SpotyClone
//
//  Created by Ana on 1/3/25.
//

import UIKit

enum PlaylistSection {
    
    case playlists
}

final class PlaylistTableViewController: UITableViewController {
      
    //MARK: - Table View DataSource
    
    typealias DataSource = UITableViewDiffableDataSource<PlaylistSection, Playlist>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PlaylistSection, Playlist>
    
    // MARK: - Data
    
    private var dataSource: DataSource?
    private let playlist = PlaylistRepository.allPlaylists
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registramos la celda
        
        tableView.register(
            UINib(nibName: PlaylistTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: PlaylistTableViewCell.identifier)
        
        // Configuramos el datasource
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, playlist in
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PlaylistTableViewCell.identifier,
                for: indexPath
            ) as? PlaylistTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: playlist)
            return cell
        }
        
        // Añadir el data source al table view
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        // Crear un snapshot con los bojetos que vamos a representar
        
        var snapshot = Snapshot()
        snapshot.appendSections([.playlists])
        snapshot.appendItems(playlist)
        dataSource?.apply(snapshot)
        
        tableView.separatorStyle = .none
    }

    
}

// MARK: - UITableViewDelegate

extension PlaylistTableViewController {
    /// Función sobreescrita para dar un tamaño a la celda
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        150
    }
    
    ///Función sobreescrita para dar información sobre la celda seleccionaa
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // obtener la celda seleccionada a través del índice en el datasource
        guard let playlistSelected = dataSource?.itemIdentifier(for: indexPath) else {
            return
        }
        
        
        
        // instanciar el viewController de destino y Pasar la información al viewControllerDetail
        
        let playlistDetailCollectionView = PlaylistDetailCollectionViewController(playlistSelected: playlistSelected)
        
        
        
        //playerViewController.songs = selectedCell.songs
        
        // navegar al viewControllerDetail
        //playlistDetailCollectionView.hidesBottomBarWhenPushed = false
        navigationController?.show(playlistDetailCollectionView, sender: self)
        }
    }

