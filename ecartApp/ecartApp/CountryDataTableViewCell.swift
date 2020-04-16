//
//  CountryDataTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 13/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class CountryDataTableViewCell: UITableViewCell {
    @IBOutlet weak var flaglabel:UILabel!
    @IBOutlet weak var countrylabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

 
    }
    
    func configure(flagStr:String,text:String){
        flaglabel.text = flagStr
        countrylabel.text = text
    }
    
}
