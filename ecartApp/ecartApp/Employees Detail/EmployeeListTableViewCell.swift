//
//  EmployeeListTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 26/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setName(name:String){
        nameLabel?.text = name
    }
    
}
