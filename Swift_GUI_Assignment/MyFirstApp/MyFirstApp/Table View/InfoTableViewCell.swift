//
//  InfoTableViewCell.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 04/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var labelCell:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text:String){
        labelCell.text = text
    }
    
    
    
}
