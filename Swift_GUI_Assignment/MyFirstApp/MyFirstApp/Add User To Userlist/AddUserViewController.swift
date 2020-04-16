//
//  AddUserViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 23/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var addressTextField:UITextField!
    @IBOutlet weak var ageTextField:UITextField!
    @IBOutlet weak var detailTextField:UITextField!
    @IBOutlet weak var userImage:UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        addressTextField.delegate = self
        ageTextField.delegate = self
        detailTextField.delegate = self
        imagePicker.delegate = self
        
        self.nameTextField.becomeFirstResponder()
        
        userImage.layer.cornerRadius = userImage.frame.size.height/2

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButton(_ sender  : UIButton){
    
    imagePicker.allowsEditing = true
    imagePicker.sourceType = .photoLibrary
    self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            userImage.contentMode = .scaleAspectFill
            userImage.image = imagePicked
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender :UIButton){
        let name = nameTextField.text!
        let address = addressTextField.text!
        let age = ageTextField.text!
        let detail = detailTextField.text!
        let image = userImage.image!
        
        print(name,address,age,detail)
        if UserListViewController.datasource.count < UserListViewController.tempdatasource.count{
            UserListViewController.datasource = UserListViewController.tempdatasource
        }
    UserListViewController.datasource.append(UserDetail(name:name,address:address,age: age,detail: detail,image: image))
        
        //print("datasource",UserListViewController.d)
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
    }

    

}

extension AddUserViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
            nameTextField.resignFirstResponder()
            addressTextField.becomeFirstResponder()
        
        
            addressTextField.resignFirstResponder()
            ageTextField.becomeFirstResponder()
        
        
            ageTextField.resignFirstResponder()
            detailTextField.becomeFirstResponder()
        
        
            detailTextField.resignFirstResponder()
    
        return true
    }
}
