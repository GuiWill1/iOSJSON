//
//  LoginViewController.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
       
        
    }
   
    
    
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    @IBAction func loginBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Feed")
        self.present(vc, animated: true, completion: nil)
      
    }
    
    
}

