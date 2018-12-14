//
//  Produto.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import Foundation

class Produto:Decodable{
    private var id: Int!
    private var nome :String!
    private var preco: Double!
    //private var custo: Double!
    private var quantidade: Int!
    
    var _id:Int{
        get{
            return id
        }set{
            id = newValue
        }
    }
    var _nome:String{
        get{
            return nome
        }set{
            nome = newValue
        }
        
    }
    var _preco:Double{
        get{
            return preco
        }set{
            preco = newValue
        }
    }
    /*var _custo:Double{
        get{
            return custo
        }set{
            custo = newValue
        }
    }*/
    var _quantidade:Int{
        get{
           return quantidade
        }set{
            quantidade = newValue
        }
    }
}
