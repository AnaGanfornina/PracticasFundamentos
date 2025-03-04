//
//  PlaylistDetailCollectionViewCell.swift
//  SpotyClone
//
//  Created by Ana on 2/3/25.
//

import UIKit

class PlaylistDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PlaylistDetailCollectionViewCell.self)

    // MARK: - Outlets

    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var songDurationLabel: UILabel!
    @IBOutlet var songArtistLabel: UILabel!
    
    // MARK: - Configuration
    
    func configure(with song: Song) {
        songTitleLabel.text = song.title
        songArtistLabel.text = song.artist
        songDurationLabel.text = song.duration
    }
}
