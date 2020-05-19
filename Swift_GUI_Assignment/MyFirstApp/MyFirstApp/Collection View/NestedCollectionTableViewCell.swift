//
//  NestedCollectionTableViewCell.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 21/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class NestedCollectionTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    

    @IBOutlet weak var collectionViews : UICollectionView!
    @IBOutlet weak var label : UILabel!
    //@IBOutlet weak var images:UIImageView!
    
    
   
    
    let datasource1 = [#imageLiteral(resourceName: "sci1.jpeg"),#imageLiteral(resourceName: "sci2.jpeg"),#imageLiteral(resourceName: "sci3.jpeg"),#imageLiteral(resourceName: "sci4.jpeg")]
    let datasource2 = [#imageLiteral(resourceName: "kid1.jpeg"),#imageLiteral(resourceName: "kid2.jpeg"),#imageLiteral(resourceName: "kid3.jpeg"),#imageLiteral(resourceName: "kid4.jpeg")]
    let datasource3 = [#imageLiteral(resourceName: "hor1.jpeg"),#imageLiteral(resourceName: "hor2.jpeg"),#imageLiteral(resourceName: "hor3.jpeg"),#imageLiteral(resourceName: "hor4.jpeg")]
    let datasource4 = [#imageLiteral(resourceName: "dra1.jpeg"),#imageLiteral(resourceName: "dra2.jpeg"),#imageLiteral(resourceName: "dra3.jpeg"),#imageLiteral(resourceName: "dra4.jpeg")]
    let datasource5 = [#imageLiteral(resourceName: "act1.jpeg"),#imageLiteral(resourceName: "act4.jpeg"),#imageLiteral(resourceName: "act2.jpeg"),#imageLiteral(resourceName: "act3.jpeg")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViews.delegate = self
        collectionViews.dataSource = self
        collectionViews.backgroundColor = .black
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViews.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! MyCollectionViewCell
        
        
        
        if label.text == "Science Fiction"{
            cell.myImage.image = datasource1[indexPath.row]
        }
        else if label.text == "Kids"{
            cell.myImage.image = datasource2[indexPath.row]
        }
        else if label.text == "Horrors"{
            cell.myImage.image = datasource3[indexPath.row]
        }
        else if label.text == "Drama"{
            cell.myImage.image = datasource4[indexPath.row]
        }
        else if label.text == "Action"{
            cell.myImage.image = datasource5[indexPath.row]
        }
        
        
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 150)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
