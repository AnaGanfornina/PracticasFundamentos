//
//  PlayerViewController.swift
//  SpotyClone
//
//  Created by Ana on 2/3/25.
//

import UIKit

class PlayerViewController: UIViewController {

    // MARK: -  Outlets
    
    @IBOutlet var titleSongLabel: UILabel!
    @IBOutlet var artitstSongLabel: UILabel!
    
    // MARK: - Data
    
    private var  playlist: Playlist
    
    // MARK: Initializer
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comenzamos la reproducción con la primera canción de la playlist
        let songs = playlist.songs
        
        titleSongLabel.text = songs.first?.title
        artitstSongLabel.text = songs.first?.artist
        
    }
}



