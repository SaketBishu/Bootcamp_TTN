//
//  NormalTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 12/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionsImage:UIImageView!
    @IBOutlet weak var optionsLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(image:UIImage,option:String){
       // print(image)
        
        optionsImage.image = image
        optionsLabel.text = option
        
    }

    
}
