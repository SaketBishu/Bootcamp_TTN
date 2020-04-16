//
//  UserDataTableViewCell.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 24/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel:UILabel?
    @IBOutlet weak var addresslabel:UILabel?
    @IBOutlet weak var agelabel:UILabel?
    @IBOutlet weak var detaillabel:UILabel?
    @IBOutlet weak var myImage:UIImageView?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellValue(userDetail:UserDetail){
        namelabel?.text = userDetail.name
        addresslabel?.text = userDetail.address
        agelabel?.text = userDetail.age
        detaillabel?.text = userDetail.detail
        myImage?.image = userDetail.image
        
        print(namelabel?.text ?? "nil")
    }
    
    
}
