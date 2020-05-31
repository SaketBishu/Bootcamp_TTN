//
//  TrendingTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 27/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trendCollectionView:UICollectionView!
    @IBOutlet weak var trendpageControl:UIPageControl!
    
    var trendingArray = [Trending]()
    var timer = Timer()
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "TrendingCollectionViewCell", bundle: nil)
        trendCollectionView.register(nib, forCellWithReuseIdentifier: "trendCell")
        
        trendCollectionView.delegate = self
        trendCollectionView.dataSource = self
        
        //trendpageControl.numberOfPages = trendingArray.count
        trendpageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.slideImage), userInfo: nil, repeats: true)
        }
        
        
        fetchTrendingData(){self.trendCollectionView.reloadData()}
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func slideImage(){
        
        if counter < trendingArray.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.trendCollectionView.scrollToItem(at:index, at: .centeredHorizontally, animated: true)
            self.trendpageControl.currentPage = counter
            counter += 1
        }
        else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.trendCollectionView.scrollToItem(at:index, at: .centeredHorizontally, animated: false)
            self.trendpageControl.currentPage = counter
            counter = 1
        }
        
    }
    
    
    func fetchTrendingData(completed: @escaping ()->()){
           let taskA = URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/trending/all/day?api_key=820016b7116f872f5f27bf56f9fdfb66")!){ data,response,error in
           
           guard error == nil else{
               print("error:\(error!)")
               return
           }
           
           guard let content = data else{
               print("no data")
               return
           }
           do{
               let datasrc = try JSONDecoder().decode(TrendingResults.self, from: content)
            
            self.trendingArray = datasrc.results
            DispatchQueue.main.async {
                completed()
               }
           }
           catch let error{
               print(error.localizedDescription)
           }
       
               
       }
           taskA.resume()
           
       }
    
}

extension TrendingTableViewCell: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trendingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = trendCollectionView.dequeueReusableCell(withReuseIdentifier: "trendCell", for: indexPath) as! TrendingCollectionViewCell
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(trendingArray[indexPath.row].posterPath)")!){ data,response,error in
            
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
                cell.trendImage.image = image
            }
            
        }
        taskA.resume()
        return cell
            
        }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 413, height: 280 )
        
    }
    
        
    }
    
    

