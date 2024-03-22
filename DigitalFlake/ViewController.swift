//
//  ViewController.swift
//  DigitalFlake
//
//  Created by saurabh wattamwar on 22/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var tfMobile: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: Inbuild method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    //MARK: Initial Setup
    func setUp(){
        tfMobile.delegate = self
        tfPassword.delegate = self
        tfMobile.keyboardType = .numberPad
        self.btnLogin.isUserInteractionEnabled = false
        self.btnLogin.layer.cornerRadius = 5
    }
    
    //MARK: Action for login button
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        var mobile = tfMobile.text
        var password = tfPassword.text
        
        guard let mobileNo = mobile, let passwordd = password else {
            return
        }
        
        if mobileNo != "" && passwordd != ""{
                self.btnLogin.isUserInteractionEnabled = true
                let vc = DetailsViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc,animated: true)
        }
    }
    
}
//MARK: Extension for Text field delegate
extension ViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (tfMobile.text != "") && (tfPassword.text != "")  {
            btnLogin.isUserInteractionEnabled = true
        }
        else {
            btnLogin.isUserInteractionEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField == tfMobile && textField == tfPassword{
            return  true
        }
        return false
    }
}

