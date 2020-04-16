//
//  CountryTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 12/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionsImage:UIImageView!
    @IBOutlet weak var optionsLabel:UILabel!
    @IBOutlet weak var flagLabel:UILabel!
    @IBOutlet weak var countryLabel:UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    func configure(image:UIImage, option:String,flagStr:String,countryStr:String){
        optionsImage.image = image
        optionsLabel.text = option
        flagLabel.text = flagStr
        countryLabel.text = countryStr
        
    }
    
}
