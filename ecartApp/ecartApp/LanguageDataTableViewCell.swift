//
//  LanguageDataTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 13/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class LanguageDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var langlabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text:String){
        langlabel.text = text
    }
    
}
