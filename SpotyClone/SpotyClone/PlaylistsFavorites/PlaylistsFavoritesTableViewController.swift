//
//  PlaylistsFavoritesTableViewController.swift
//  SpotyClone
//
//  Created by Ana on 5/3/25.
//

import UIKit

final class PlaylistsFavoritesTableViewController: UITableViewController {
        
    // MARK: - Table View DataSource
    
    typealias DataSource = UITableViewDiffableDataSource<PlaylistSection, Playlist>
    typealias Snapshot = NSDiffableDataSourceSnapshot<PlaylistSection, Playlist>
    
    
    // MARK: - Data
    
    private var dataSource: DataSource?
    private var favoritePlaylists: [Playlist] // [Int: Playlist] = [:]
    
    
    // MARK: - Initializer
    
    init(favoritePlaylists: [Playlist]) {
        self.favoritePlaylists = favoritePlaylists
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registramos celda
        tableView.register(
            UINib(nibName: PlaylistsFavoritesTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: PlaylistsFavoritesTableViewCell.identifier)
        
        // Configuramos el datasource
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, playlist in
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PlaylistsFavoritesTableViewCell.identifier,
                for: indexPath
            ) as? PlaylistsFavoritesTableViewCell else {
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
        snapshot.appendItems(favoritePlaylists)
        dataSource?.apply(snapshot)
        
        tableView.separatorStyle = .none

       
    }
    
    
}
