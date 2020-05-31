//
//  EmployeeCardViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 26/05/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class EmployeeCardViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var cardTableView:UITableView!
    var datasource = [DataEmp]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "EmployeeCardTableViewCell", bundle: nil)
        cardTableView.register(nib, forCellReuseIdentifier: "cardCell")
        
        fetchData {
            self.cardTableView.reloadData()
        }

        
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
            DispatchQueue.main.async {
                completed()
            }
            print("***********************")
            print(self.datasource)
        }
        catch let error{
            print(error.localizedDescription)
        }
    
            
    }
        taskA.resume()
        
    }
  
    
}
extension EmployeeCardViewController{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cardTableView.dequeueReusableCell(withIdentifier: "cardCell") as! EmployeeCardTableViewCell
        cell.setValue(id: datasource[indexPath.row].id ?? "", name: datasource[indexPath.row].employeeName ?? "", age: datasource[indexPath.row].employeeAge ?? "", salary: datasource[indexPath.row].employeeSalary ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cardTableView.deselectRow(at: indexPath, animated: true)
    }
}
