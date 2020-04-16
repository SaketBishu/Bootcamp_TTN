//
//  LanguageViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 13/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tablelang:UITableView!
    var codes:[String] = []
    var languages:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        codes = NSLocale.isoLanguageCodes
        
        for code in NSLocale.isoLanguageCodes{
            
            let id = NSLocale.localeIdentifier(fromComponents:[NSLocale.Key.languageCode.rawValue:code])
            
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey : NSLocale.Key.identifier, value: id) ?? "language not found for code \(code)"
            languages.append(name)
        }
        
        let nib = UINib.init(nibName: "LanguageDataTableViewCell", bundle:nil)
        tablelang.register(nib, forCellReuseIdentifier: "LangDataCell")

        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablelang.dequeueReusableCell(withIdentifier: "LangDataCell") as! LanguageDataTableViewCell
        cell.configure(text: languages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for views in (self.navigationController?.viewControllers ?? []) {
        if views is AccountsViewController{
            (views as? AccountsViewController)!.setLabelLanguage(langStr: codes[indexPath.row])
            
        }
    }
        navigationController?.popViewController(animated: true)
    }

    
}
