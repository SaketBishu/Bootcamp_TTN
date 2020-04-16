//
//  CountryViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 13/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
     
    @IBOutlet weak var tableCountry:UITableView!
    
    var countries : [String] = []
    var flags:[String] = []
    var codes:[String] = []
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        for code in NSLocale.isoCountryCodes{
            var flag = ""
            
            let id = NSLocale.localeIdentifier(fromComponents:[NSLocale.Key.countryCode.rawValue:code])
            
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey : NSLocale.Key.identifier, value: id) ?? "country not found for code \(code)"
            countries.append(name)
            
            for us in code.unicodeScalars{
                flag.append(String(UnicodeScalar(127397 + us.value)!))
            }
            flags.append(flag)
        }
        
        codes = NSLocale.isoCountryCodes
        
        let nib = UINib.init(nibName: "CountryDataTableViewCell", bundle: nil)
        tableCountry.register(nib, forCellReuseIdentifier: "CountryDataCell")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableCountry.dequeueReusableCell(withIdentifier: "CountryDataCell") as! CountryDataTableViewCell
        cell.configure(flagStr: flags[indexPath.row], text: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        for views in (self.navigationController?.viewControllers ?? []) {
            if views is AccountsViewController{
                (views as? AccountsViewController)!.setLabelCountry(flagStr: flags[indexPath.row], codeStr: codes[indexPath.row])
                
            }
        
    }
        
        navigationController?.popViewController(animated: true)
    }
    

    

}
