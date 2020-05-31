//
//  EmployeeCardTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 26/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel:UILabel?
    @IBOutlet weak var nameLabel:UILabel?
    @IBOutlet weak var ageLabel:UILabel?
    @IBOutlet weak var salaryLabel:UILabel?
    @IBOutlet weak var profileImageView:UIImageView!
    
//    profileImageView.layer.cornerRadius = 20 //profileImageView.frame.size.height/2
//    profileImageView.contentMode = .scaleAspectFill


    override func awakeFromNib() {
        super.awakeFromNib()
//        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
//        profileImageView.contentMode = .scaleAspectFill
//       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setValue(id:String,name:String,age:String,salary:String){
        idLabel?.text = id
        nameLabel?.text = name
        ageLabel?.text  = age
        salaryLabel?.text = salary
        
    }
    
}
