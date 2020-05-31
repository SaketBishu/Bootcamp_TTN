//
//  MoviesDetailsDisplayViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 29/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class MoviesDetailsDisplayViewController: UIViewController{
    
    var selectedArray = [Movies]()
    var index:Int = -1
    
    
    @IBOutlet weak var movieImageView:UIImageView!
    @IBOutlet weak var movieName:UILabel!
    @IBOutlet weak var ratingLabel:UILabel!
    @IBOutlet weak var genreLanguageLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var relatedMovieCollectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        relatedMovieCollectionView.delegate = self
        relatedMovieCollectionView.dataSource = self
        
        setDetails()
        
        tabBarController?.tabBar.isHidden = true

        
    }
    
    
    func setDetails(){
        
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(self.selectedArray[self.index].movieImage)")!){ data,response,error in
            
            guard error == nil else{
                print("error:\(error!)")
                return
            }
            
            guard let content = data else{
                print("no data")
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: content)
                self.movieImageView.image = image
            }
            
        }
        taskA.resume()
        
        self.movieName.text = selectedArray[self.index].title
        self.ratingLabel.text = String(selectedArray[self.index].rating)+"/10"
        self.genreLanguageLabel.text = "Action | Adventure | \(selectedArray[self.index].releaseDate)"
        self.descriptionLabel.text = selectedArray[self.index].description
        //selectedArray.remove(at: index)
        
        
        
    }
    
    

    
}

extension MoviesDetailsDisplayViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = relatedMovieCollectionView.dequeueReusableCell(withReuseIdentifier: "relatedCell", for: indexPath) as! MovieDetailsCollectionViewCell
        cell.cellView.layer.cornerRadius = 20
        cell.cellView.layer.masksToBounds = true

        let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(self.selectedArray[indexPath.row].posterImage)")!){ data,response,error in

            guard error == nil else{
                print("error:\(error!)")
                return
            }

            guard let content = data else{
                print("no data")
                return
            }
            DispatchQueue.main.async {
                guard let images = UIImage(data: content)else{return}
                print(images)
                cell.movierelatedImage.image = images
            }

        }
        taskA.resume()
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:165, height:160)
    }


}
