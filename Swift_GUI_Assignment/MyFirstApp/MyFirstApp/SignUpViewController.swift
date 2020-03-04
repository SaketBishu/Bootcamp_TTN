//
//  SignUpViewController.swift
//  MyFirstApp
//
//  Created by Saket Kumar on 02/03/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    
    @IBOutlet weak var labelEmail: UITextField!
    
    @IBOutlet weak var labelUsername: UITextField!
    
    @IBOutlet weak var labelDOB: UITextField!
    
    @IBOutlet weak var labelBirthPlace: UITextField!
    
    @IBOutlet weak var labelPhoneNo: UITextField!
    @IBOutlet weak var showStatus: UISwitch!
    
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    let myPickerController = UIImagePickerController()
    //var myDatePicker:UIDatePicker = UIDatePicker()
    //myDatePicker.datePickerMode = .date
    var myDatePicker:UIDatePicker = UIDatePicker()
           
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.labelUsername.becomeFirstResponder()
        self.title = "SIGN UP"
        myImageView.layer.cornerRadius = myImageView.frame.size.height/2
        labelUsername.delegate = self
        labelEmail.delegate = self
        myPickerController.delegate = self;
        
        myDatePicker.datePickerMode = UIDatePicker.Mode.date
        labelDOB.delegate = self
        
        myDatePicker.addTarget(self, action: #selector(self.datePickerAction(_:)), for: UIControl.Event.valueChanged)
        labelDOB.inputView = myDatePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let Done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePickDate))
        toolbar.setItems([Done], animated: true)
        labelDOB.inputAccessoryView = toolbar

        
    

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButton(_ sender  : UIButton){
        
        myPickerController.allowsEditing = true
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
        
        //let actionSheet = UIAlertController(title: "select", message: nil, preferredStyle:.actionSheet)
        
        //actionSheet.addAction(<#T##action: UIAlertAction##UIAlertAction#>)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImageView.contentMode = .scaleAspectFill
            myImageView.image = imagePicked
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func isOnOf(_ sender : UISwitch){
        if sender.isOn{
            labelStatus.text = "Keep My Profile Private"
        }
        else{
            labelStatus.text = "Keep My Profile Public"
        }
    }
    
    @IBAction func datePickerAction(_ sender:UIDatePicker) {
                let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.short
        labelDOB.text = dateformatter.string(from :sender.date)
        
        //labelDOB.text = strDate
        
    }
    @objc func donePickDate(){
        self.view.endEditing(true)
    }
    
    func pushToviewControl()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewUserDetailViewController")
        //self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        //var MyviewControllers = self.navigationController?.viewControllers
    }
    
    
    @IBAction func signUpBuutonClicked(_ sender:UIButton) {
        pushToviewControl()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignUpViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        labelUsername.resignFirstResponder()
        labelEmail.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
