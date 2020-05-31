//
//  HomeMoviesCollectionViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 27/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class HomeMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        movieImage.layer.cornerRadius = 20
//        movieImage.clipsToBounds = true
    }
    
    func setValue(genre:String,rating:String,movie:String){
        genreLabel.text = genre
        ratingLabel.text = rating + "/10"
        movieLabel.text = movie
    }

}
