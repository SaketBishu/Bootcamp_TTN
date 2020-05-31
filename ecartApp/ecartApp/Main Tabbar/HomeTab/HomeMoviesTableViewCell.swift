//
//  HomeMoviesTableViewCell.swift
//  ecartApp
//
//  Created by Saket Kumar on 27/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

protocol PassDataDelegate {
    func selectedMovie(_ indexPath : IndexPath, _ movieClickDetails: [Movies])
}

class HomeMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieLabel:UILabel!
    @IBOutlet weak var movieCollectionView:UICollectionView!
    
    var popularDatas = [Movies]()
    var HighRatedDatas = [Movies]()
    var KidsDatas = [Movies]()
    var BestDramaDatas = [Movies]()
    
    var delegate : PassDataDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "HomeMoviesCollectionViewCell", bundle: nil)
        movieCollectionView.register(nib, forCellWithReuseIdentifier: "moviesCell")

        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self

        fetchPopularData(){self.movieCollectionView.reloadData()}
        fetchHighestRateData(){self.movieCollectionView.reloadData()}
        fetchKidsData(){self.movieCollectionView.reloadData()}
        fetchBestDramaData(){self.movieCollectionView.reloadData()}
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func fetchPopularData(completed: @escaping ()->()){
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=\(TMDBApiKey)")!){ data,response,error in

               guard error == nil else{
                   print("error:\(error!)")
                   return
               }

               guard let content = data else{
                   print("no data")
                   return
               }
               do{
                   let datasrc = try JSONDecoder().decode(MoviesResults.self, from: content)

                self.popularDatas = datasrc.results
                print("@@@@@@@@Popular Datas@@@@@@")
                print(self.popularDatas)
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

    func fetchHighestRateData(completed: @escaping ()->()){
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2019-09-15&primary_release_date.lte=2019-10-22&api_key=\(TMDBApiKey)")!){ data,response,error in

               guard error == nil else{
                   print("error:\(error!)")
                   return
               }

               guard let content = data else{
                   print("no data")
                   return
               }
               do{
                   let datasrc = try JSONDecoder().decode(MoviesResults.self, from: content)

                self.HighRatedDatas = datasrc.results
                print("@@@@@@@@High Rated Datas@@@@@@")
                print(self.popularDatas)
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

    func fetchKidsData(completed: @escaping ()->()){
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/discover/movie?with_genres=53&primary_release_year=2020&api_key=\(TMDBApiKey)")!){ data,response,error in

               guard error == nil else{
                   print("error:\(error!)")
                   return
               }

               guard let content = data else{
                   print("no data")
                   return
               }
               do{
                   let datasrc = try JSONDecoder().decode(MoviesResults.self, from: content)

                self.KidsDatas = datasrc.results
                print("@@@@@@@@@@ kids data @@@@@@")
                print(self.KidsDatas)
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



    func fetchBestDramaData(completed: @escaping ()->()){
        let taskA = URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&api_key=\(TMDBApiKey)")!){ data,response,error in

               guard error == nil else{
                   print("error:\(error!)")
                   return
               }

               guard let content = data else{
                   print("no data")
                   return
               }
               do{
                   let datasrc = try JSONDecoder().decode(MoviesResults.self, from: content)

                self.BestDramaDatas = datasrc.results
                
                print("************* Best Drama *****")
                print(self.BestDramaDatas)
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



    func setName(movie:String){
        movieLabel.text = movie
    }
}
    


extension HomeMoviesTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var counts:Int = 0
        if movieLabel.text == "Most Popular"{
            counts =  popularDatas.count
            print("Most popular count",counts)
        }
        else if movieLabel.text == "Highest Rated"{
            counts =  HighRatedDatas.count
            print("Most High Rated count",counts)
        }
        else if movieLabel.text == "Kids Favourite"{
            counts =  KidsDatas.count
            print("Most kids count",counts)
        }
        else if movieLabel.text == "Best Drama"{
            counts =  BestDramaDatas.count
            print("Most Dramas count",counts)
        }
        print("count is",counts)
        return counts

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! HomeMoviesCollectionViewCell
  
//        cell.contentView.layer.cornerRadius = 20
//        cell.contentView.layer.masksToBounds = true
        if movieLabel.text == "Most Popular"{
            cell.setValue(genre:"Action",rating:String(popularDatas[indexPath.row].rating), movie: popularDatas[indexPath.row].title)

            let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(popularDatas[indexPath.row].posterImage)")!){ data,response,error in

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
                    cell.movieImage.image = image
                }

            }
            taskA.resume()



        }
        else if movieLabel.text == "Highest Rated"{
            print("the index path",indexPath.row)
            cell.setValue(genre:"Action|Comedy",rating:String(HighRatedDatas [indexPath.row].rating), movie:HighRatedDatas[indexPath.row].title)

            let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(HighRatedDatas [indexPath.row].posterImage)")!){ data,response,error in

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
                    cell.movieImage.image = image
                }

            }
            taskA.resume()

        }
        else if movieLabel.text == "Kids Favourite"{
            cell.setValue(genre:"Action|Adventure",rating:String(KidsDatas [indexPath.row].rating), movie:KidsDatas[indexPath.row].title)

            let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(KidsDatas [indexPath.row].posterImage)")!){ data,response,error in

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
                    cell.movieImage.image = image
                }

            }
            taskA.resume()

        }
        else if movieLabel.text == "Best Drama"{
            cell.setValue(genre:"Action|Drama",rating:String(BestDramaDatas [indexPath.row].rating), movie: BestDramaDatas[indexPath.row].title)

            let taskA = URLSession.shared.dataTask(with: URL(string:"https://image.tmdb.org/t/p/w500\(BestDramaDatas [indexPath.row].posterImage)")!){ data,response,error in

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
                    cell.movieImage.image = image
                }

            }
            taskA.resume()

        }

     return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 208, height: 233 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        movieCollectionView.deselectItem(at: indexPath, animated: true)
        
        print("didselect")
        
        
        if self.movieLabel.text == "Most Popular"{
            delegate?.selectedMovie(indexPath,popularDatas)
            
        }
        else if self.movieLabel.text == "Highest Rated"{
            delegate?.selectedMovie(indexPath,HighRatedDatas)
            
        }
        else if self.movieLabel.text == "Kids Favourite"{
            delegate?.selectedMovie(indexPath,KidsDatas)
        }
        else if self.movieLabel.text == "Best Drama"{
            delegate?.selectedMovie(indexPath,BestDramaDatas)
        }
    }

}
