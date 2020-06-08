//
//  ApiIntegrationViewController.swift
//  LockDownPractise
//
//  Created by Saket Kumar on 02/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

struct Country{
    let countryName:String
    let countryCode:String
}

class ApiIntegrationViewController: UIViewController {
    
    @IBOutlet weak var displayTable:UITableView!
    var countrySource = [Country]()
    let errorImage = #imageLiteral(resourceName: "Error.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        displayTable.register(nib, forCellReuseIdentifier:"cell")
        
        fetchdata{
            self.displayTable.reloadData()
        }
        
    }
    
    
    
    func fetchdata( completed:@escaping () -> ()){
        let taskA = URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/hjnilsson/country-flags/master/countries.json")!){ data,response,error in
            
            guard error == nil else{
                print("error:\(error!)")
                return
            }
            
            guard let content = data else{
                print("no data")
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let json = json as? [String:Any]{
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    for key in json.keys{
                        self.countrySource.append(Country(countryName: json[key] as! String, countryCode: key))
                    }
                    DispatchQueue.main.async {
                        completed()
                        
                    }
                    
                }
            }
            
            catch let error{
                print(error.localizedDescription)
            }
        }
        taskA.resume()
        
        print(countrySource)
    }
    
    
   }

extension ApiIntegrationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrySource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CountryTableViewCell
        var image:UIImage?

        let taskB = URLSession.shared.dataTask(with: URL(string: "https://www.countryflags.io/\(countrySource[indexPath.row].countryCode)/flat/64.png")!){ data,response,error in
            
            guard error == nil else{
                print("error:\(error!)")
                return
            }

            DispatchQueue.main.async {
                

                guard let content = data else{
                    print("no data")
                    return
                }

                image = UIImage(data: content)
                //print(image!)
                
                cell.setData(image: image ?? self.errorImage,name:self.countrySource[indexPath.row].countryName)
                //self.displayTable.reloadData()
            }
            
        }
        taskB.resume()


        
        return cell
        

    }
    
    
}
