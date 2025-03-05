//
//  PlaylistTableViewCell.swift
//  SpotyClone
//
//  Created by Ana on 1/3/25.
//

import UIKit

final class PlaylistTableViewCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = String(describing: PlaylistTableViewCell.self)
    

    // MARK: - Outlets
    
    @IBOutlet var playlistNameLabel: UILabel!
    @IBOutlet var playlistDescriptionLabel: UILabel!
    @IBOutlet var roundedBackgroundView: UIView!
    @IBOutlet var isFavoriteImage: UIImageView!
    
    // MARK: - Configuration
    
    func configure(with playlist: Playlist, isFavorite: Bool) {
        playlistNameLabel.text = "\(playlist.emoji)  \(playlist.title)"
        playlistDescriptionLabel.text = playlist.description
        roundedBackgroundView.backgroundColor = UIColor(hex: playlist.color)
        roundedBackgroundView.layer.cornerRadius = 12
        
        // Configuramos el diseño de la estrella de favoritos
        
        isFavoriteImage.image = UIImage(systemName: "star.fill")
        isFavoriteImage.tintColor = .yellow
    
        // Mostrar o esconder la estrella
        
        isFavoriteImage.isHidden = !isFavorite
        
    }
    
    // MARK: - Button Acction
    
    
}
