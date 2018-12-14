//
//  SignUpViewController.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nomeField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var senhaField: UITextField!
    @IBOutlet weak var telefoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastro"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func sendJson(cliente: Cliente){
        let postBody = ["nome": cliente._nome,
                        "email" : cliente._email,
                        "telefone" : cliente._telefone,
                        "senha" : cliente._senha
        ]
        
        let notesEndpoint = URL(string: "http://169.254.250.12:8090/cliente")!
        var request = URLRequest(url: notesEndpoint)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: postBody, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("Bearer \(Stormpath.sharedSession.accessToken ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request)
        task.resume()
        
        /*let json: [String: Any] = ["nome": cliente._nome,
                                   "email" : cliente._email,
                                   "telefone" : cliente._telefone,
                                   "senha" : cliente._senha
                                   ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://169.254.250.12:8090/cliente")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print("response:",responseJSON)
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Feed")
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        task.resume()*/
    }

   
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    @IBAction func signBtn(_ sender: Any) {
        let user = Cliente()
        if let nome = nomeField.text{
            user._nome = nome
        }
        if let email = emailField.text{
            user._email = email
        }
        if let senha = senhaField.text{
            user._senha = senha
        }
        if let telefone = telefoneField.text{
            user._telefone = telefone
        }
        if nomeField.text != nil {
            sendJson(cliente: user)
        }
       
    }

}
