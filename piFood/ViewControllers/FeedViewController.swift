//
//  FeedViewController.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    @IBOutlet weak var carrinhoTotal: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var ipUrl:String!
    var cellClicked:Int!
    
    var produtos = [Produto]()
    var produtosSelect = [Produto]()
    var itemCarrinho = [ItemCarrinho]()
    var total = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getIp()
        
      
       
    }
    func getIp(){
        let alert = UIAlertController(title: "Configuração de IP", message: "Insira  IP", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Insira o IP aqui. Ex: 192.168.0.1:8080"
        })
       
        
        alert.addAction(UIAlertAction(title: "Enviar", style: .default, handler: { action in
            
            if let ip = alert.textFields?.first?.text {
                print("Your name: \(ip)")
                self.ipUrl = ip
                self.getJSON()
            }
            
        }))
        
        self.present(alert, animated: true)
    }
    fileprivate func getJSON(){
        let urlString = "http://\(String(ipUrl))/produto"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {(data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Errouuu: \(err)")
                    return
                }
                guard let data = data else {return}
                
                do{
                    let decoder = JSONDecoder()
                    self.produtos = try decoder.decode([Produto].self, from: data)
                    self.tableView.reloadData()
                }catch let jsonErr{
                    print("Errooww:\(jsonErr)")
                }
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.nomeLabel.text = produtos[indexPath.row]._nome
        cell.precoLabel.text = "Preço R$\(produtos[indexPath.row]._preco)"
        cell.stepper.addTarget(self, action: #selector(self.pressStepper(_:)), for: .touchUpInside)
        self.cellClicked = indexPath.row
        return cell
    }
    
    @objc func pressStepper(_ sender: UIStepper){
        print("value",sender.value)
        let point = sender.convert(CGPoint.zero, to: tableView as UIView)
        let indexPath: IndexPath! = tableView.indexPathForRow(at:point)
       //let index : NSIndexPath =  self.indexPathForCellContainingView(view: sender, inTableView: tableView)
        //let index : NSIndexPath =  self.indexPathForCellContainingView(view: sender, inTableView: tableView)
        let car = ItemCarrinho()
        total = Double(produtos[indexPath.row]._preco * sender.value)
        let tot = String(total)
        self.carrinhoTotal.text = "R$ \(tot)"
        
        print("index: \(indexPath.row)")
        print(produtos[indexPath.row]._id)
        print(produtos[indexPath.row]._nome)
    }
    func indexPathForCellContainingView(view: UIView, inTableView tableView: UITableView) -> NSIndexPath {
        let viewCenterRelativeToTableview = tableView.convert(CGPoint(x: view.bounds.midX, y: view.bounds.midY), from: view)
        let cellIndexPath = tableView.indexPathForRow(at: viewCenterRelativeToTableview)!
        return cellIndexPath as NSIndexPath
    }

}
