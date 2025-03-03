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
    // MARK: - Configuration
    
    func configure(with playlist: Playlist) {
        playlistNameLabel.text = "\(playlist.emoji)  \(playlist.title)"
        playlistDescriptionLabel.text = playlist.description
        roundedBackgroundView.backgroundColor = UIColor(hex: playlist.color)
        roundedBackgroundView.layer.cornerRadius = 12
        
    }
    
    // MARK: - Button Acction
    
    
}
