//
//  CountryTableViewCell.swift
//  LockDownPractise
//
//  Created by Saket Kumar on 02/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flageImage: UIImageView?
    @IBOutlet weak var countryLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(image:UIImage,name:String){
        
        flageImage?.image = image
        flageImage?.contentMode = .scaleAspectFill
        countryLabel?.text = name
    }
    
}
