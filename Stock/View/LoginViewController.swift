//
//  LoginViewController.swift
//  Stock
//
//  Created by ctsuser on 1/31/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBAction func onClick(_ sender: UIButton) {
		print("hello")
		performSegue(withIdentifier: "loginSegue", sender: nil)
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
