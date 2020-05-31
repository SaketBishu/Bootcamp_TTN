//
//  AccountsViewController.swift
//  ecartApp
//
//  Created by Saket Kumar on 11/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet public  weak var optionsTable: UITableView!
    @IBOutlet weak var imageSelect: UIImageView!
    
    var tapGesture = UITapGestureRecognizer()
    let mypickerController = UIImagePickerController()
    
    
    
    
    public let datasource = [["Track Order","Size Chart","Notifications","Location"],["Country","Language","About Us","FAQ","Shipping & Returns"]]
    
    let imagesource = [[#imageLiteral(resourceName: "Track Order"),#imageLiteral(resourceName: "Size Chart"),#imageLiteral(resourceName: "Notification"),#imageLiteral(resourceName: "Store Locator")],[#imageLiteral(resourceName: "Country"),#imageLiteral(resourceName: "Language"),#imageLiteral(resourceName: "About Us"),#imageLiteral(resourceName: "FAQ"),#imageLiteral(resourceName: "Shipping")]]
    let sectionHeader = [" "," "]
    
    var countryCode = "IN"
    var languageCode = "HIN"
    var flagImageStr: String = {()-> String in var flag = ""
        for us in "IN".unicodeScalars{
            flag.append(String(UnicodeScalar(127397 + us.value)!))
        }
        return flag
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSelect.layer.cornerRadius = imageSelect.frame.size.height/2
        
        let nib1 = UINib.init(nibName: "NormalTableViewCell", bundle: nil)
        optionsTable.register(nib1, forCellReuseIdentifier: "cellNormal")
        
        let nib2 = UINib.init(nibName: "CountryTableViewCell", bundle: nil)
        optionsTable.register(nib2, forCellReuseIdentifier: "cellCountry")
        
        let nib3 = UINib.init(nibName: "LanguageTableViewCell", bundle: nil)
        optionsTable.register(nib3, forCellReuseIdentifier: "cellLang")
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGesture.numberOfTapsRequired = 1
        imageSelect.isUserInteractionEnabled = true
        imageSelect.addGestureRecognizer(tapGesture)
        
        mypickerController.delegate = self


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedIndex = optionsTable.indexPathForSelectedRow{
            optionsTable.deselectRow(at: selectedIndex, animated: true)
            
        }
        optionsTable.reloadData()
    }
    
    @objc func imageTapped(_ sender:UITapGestureRecognizer){
        
        mypickerController.allowsEditing = true
        mypickerController.sourceType = .photoLibrary
        self.present(mypickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageSelect.contentMode = .scaleAspectFill
            imageSelect.image = imagePicked
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(datasource[indexPath.section][indexPath.row] == "Country"){
            let cell = optionsTable.dequeueReusableCell(withIdentifier: "cellCountry") as! CountryTableViewCell
            cell.configure(image:imagesource[indexPath.section][indexPath.row],option:datasource[indexPath.section][indexPath.row],flagStr:flagImageStr,countryStr: countryCode )
            
            return cell
        }
        else if(datasource[indexPath.section][indexPath.row] == "Language"){
            let cell = optionsTable.dequeueReusableCell(withIdentifier: "cellLang") as! LanguageTableViewCell
            cell.configure(image:imagesource[indexPath.section][indexPath.row],optionname:datasource[indexPath.section][indexPath.row],optionLang: languageCode)
            
            return cell
        }
        
        else{
            let cell = optionsTable.dequeueReusableCell(withIdentifier: "cellNormal") as! NormalTableViewCell
            cell.configure(image:imagesource[indexPath.section][indexPath.row],option:datasource[indexPath.section][indexPath.row])
            return cell
    }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(datasource[indexPath.section][indexPath.row] == "Country"){
            guard let vc = storyboard?.instantiateViewController(identifier: "CountryViewController") as? CountryViewController else{return}
            navigationController?.pushViewController(vc, animated: true)
            
        }
        if(datasource[indexPath.section][indexPath.row] == "Language"){
            guard let vc = storyboard?.instantiateViewController(identifier: "LanguageViewController") as? LanguageViewController else{return}
            navigationController?.pushViewController(vc, animated: true)
            
        }
        if(datasource[indexPath.section][indexPath.row] == "Location"){
            guard let vc = storyboard?.instantiateViewController(identifier: "GetLocationViewController") as? GetLocationViewController else{return}
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        optionsTable.deselectRow(at: indexPath, animated: true)
        
        
    }
    
   
     func setLabelCountry(flagStr:String,codeStr:String)
    {
        flagImageStr = flagStr
        countryCode = codeStr
        
    }
    
    func setLabelLanguage(langStr:String){
        languageCode = langStr
    }

    
}

extension AccountsViewController{
    
    @IBAction func loginTapped(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



