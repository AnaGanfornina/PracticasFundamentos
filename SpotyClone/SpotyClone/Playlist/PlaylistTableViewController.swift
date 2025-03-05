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
    // Aquí vamos a guardar todas las playlist favortas
    private var favoritePlaylists: [Int: Playlist] = [:]
        
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registramos la celda
        
        tableView.register(
            UINib(nibName: PlaylistTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: PlaylistTableViewCell.identifier)
        
        // Configuramos el datasource
        
        dataSource = DataSource(tableView: tableView) { [weak self] tableView, indexPath, playlist in
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PlaylistTableViewCell.identifier,
                for: indexPath
            ) as? PlaylistTableViewCell else {
                return UITableViewCell()
            }
            
            // Busco si la playlist que viene en el closure es favorita o no
            let foundFavoritePlaylist = self?.favoritePlaylists[playlist.id]
            let isFavorite = foundFavoritePlaylist != nil
            
            cell.configure(with: playlist, isFavorite: isFavorite)
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
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceive),
            name: NSNotification.Name("didToggleFavorite"),
            object: nil
        )
    }

    @objc
    func didReceive(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let playlist = userInfo["favoritePlaylist"] as? Playlist,
              var snapshot = dataSource?.snapshot() else {
            return
        }
        
        // Si he encontrado un favorito significa que ya la tengo, por lo tanto la voy a eliminar
        if let foundFavorite = favoritePlaylists[playlist.id] {
            favoritePlaylists.removeValue(forKey: foundFavorite.id)
        } else {
            favoritePlaylists[playlist.id] = playlist
        }
        
        snapshot.reloadItems([playlist]) // Le pasamos un array de objetos a refrescar
        dataSource?.apply(snapshot)
        
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
        
        let playlistDetailCollectionView = PlaylistDetailCollectionViewController(
            playlistSelected: playlistSelected,
            isFavorite: favoritePlaylists[playlistSelected.id] != nil
        )
        
        
        
        //playerViewController.songs = selectedCell.songs
        
        // navegar al viewControllerDetail
        //playlistDetailCollectionView.hidesBottomBarWhenPushed = false
        navigationController?.show(playlistDetailCollectionView, sender: self)
        }
    }

