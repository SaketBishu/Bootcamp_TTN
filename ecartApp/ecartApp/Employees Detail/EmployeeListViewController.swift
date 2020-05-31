//
//  EmployeeListViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 26/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var listTableView:UITableView!
    var datasource = [DataEmp]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "EmployeeListTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: "listCell")
        
        fetchData {
            self.listTableView.reloadData()
        }
//        print("****************************")
//        print(datasource)
//
        
    }
    
    func fetchData(completed: @escaping ()->()){
        let taskA = URLSession.shared.dataTask(with: URL(string: "http://dummy.restapiexample.com/api/v1/employees")!){ data,response,error in
        
        guard error == nil else{
            print("error:\(error!)")
            return
        }
        
        guard let content = data else{
            print("no data")
            return
        }
        do{
            let datasrc = try JSONDecoder().decode(EmployeeData.self, from: content)
            self.datasource = datasrc.data!
            print("************")
            
            print(self.datasource)
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
extension EmployeeListViewController{
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    datasource.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell") as! EmployeeListTableViewCell
       print("************************************")
       print(datasource[indexPath.row].employeeName ?? "NoName")
       cell.setName(name: datasource[indexPath.row].employeeName ?? "NoName")
       return cell
       
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
   
}
