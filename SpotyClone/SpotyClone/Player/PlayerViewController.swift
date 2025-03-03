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
    
    var songs: [Song]? // FIXME: - Como tenddría que acceder a estas variables si fueran privadas ?
    
    // MARK: Initializer
    
    init() {
        self.songs = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Comenzamos la reproducción con la primera canción de la playlist
        guard let songs = songs else { return }
        
        titleSongLabel.text = songs.first?.title
        artitstSongLabel.text = songs.first?.artist
        
    }
}



