//
//  SearchCollectionViewCell.swift
//  SpotyClone
//
//  Created by Ana on 1/3/25.
//

import UIKit

final class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var genreNamedLabel: UILabel!
    
    // MARK: - Congiguration
    
    func configure(with genre: Genre) {
        genreNamedLabel.text = genre.name
        backgroundColor = UIColor(hex: genre.color)
        layer.cornerRadius = 12
    }
    
    
    
}
