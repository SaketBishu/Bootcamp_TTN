//
//  HomeViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 11/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    let datasource = [nil,"Most Popular","Highest Rated","Kids Favourite","Best Drama"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib1 = UINib(nibName: "TrendingTableViewCell", bundle: nil)
        let nib2 = UINib(nibName: "HomeMoviesTableViewCell", bundle: nil)
        
        homeTableView.register(nib1, forCellReuseIdentifier: "cellTrend")
        homeTableView.register(nib2, forCellReuseIdentifier: "cellMovies")
        
        homeTableView.delegate = self
        homeTableView.dataSource = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    
    

    

}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "cellTrend") as! TrendingTableViewCell
            return cell
        }
        else{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "cellMovies") as! HomeMoviesTableViewCell
            cell.setName(movie: datasource[indexPath.row] ?? "")
            cell.delegate = self
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 300
        }
        else{
            return 250
        }
    }
    
    
}

extension HomeViewController:PassDataDelegate{
    func selectedMovie(_ indexPath: IndexPath, _ movieSelectDetails: [Movies]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviesDetailsDisplayViewController") as! MoviesDetailsDisplayViewController
        
        vc.selectedArray = movieSelectDetails
        vc.index = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
