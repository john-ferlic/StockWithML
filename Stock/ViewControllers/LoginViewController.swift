//
//  LoginViewController.swift
//  Stock
//
//  Created by ctsuser on 1/31/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = ViewModel()
	
	@IBAction func onClick(_ sender: UIButton) {
		print("hello")
        guard let name = usernameTextField.text, let pass = passwordTextField.text else {
            print("empty strings")
            return
        }
        print("username \(name) and password \(pass)")
        viewModel.login(username: name, password: pass, completion: { result in
            if result == true{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alertController = UIAlertController(title: "Error", message: "You entered a wrong username/password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        })
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}
