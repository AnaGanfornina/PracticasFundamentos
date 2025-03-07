//
//  PlaylistsFavoritesTableViewCell.swift
//  SpotyClone
//
//  Created by Ana on 5/3/25.
//

import UIKit

final class PlaylistsFavoritesTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = String(describing: PlaylistsFavoritesTableViewCell.self)
    
    // MARK: -  Outlets
    
    @IBOutlet var playlistNameLabel: UILabel!
    @IBOutlet var playlistDescriptionLabel: UILabel!
    @IBOutlet var roundedBackgroundView: UIView!

   // MARK: - Configuration
    
    func configure(with playlist: Playlist) {
        
        playlistNameLabel.text = "\(playlist.emoji)  \(playlist.title)"
        playlistDescriptionLabel.text = playlist.description
        roundedBackgroundView.backgroundColor = UIColor(hex: playlist.color)
        roundedBackgroundView.layer.cornerRadius = 12
    }
    
}
