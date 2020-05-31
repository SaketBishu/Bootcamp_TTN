//
//  TrendingCollectionViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 27/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var trendImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        trendImage.layer.cornerRadius = 5
        trendImage.clipsToBounds = true
    }
    

}
