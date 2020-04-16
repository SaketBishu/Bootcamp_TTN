//
//  LanguageTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 12/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionImage:UIImageView!
    @IBOutlet weak var optionlabel:UILabel!
    @IBOutlet weak var optionLanguage:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(image:UIImage,optionname:String,optionLang:String){
        
        optionImage.image = image
        optionlabel.text = optionname
        optionLanguage.text = optionLang.uppercased()
        
    }

    
}
