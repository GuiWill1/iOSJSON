//
//  Cliente.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import Foundation

class Cliente{
    
    private var nome : String!
    private var senha : String!
    private var telefone : String!
    private var email : String!
    
    var _nome:String{
        get{
            return nome
        }set{
            nome = newValue
        }
    }
    var _senha:String{
        get{
            return senha
        }set{
            senha = newValue
        }
    }
    var _telefone:String{
        get{
            return telefone
        }set{
            telefone = newValue
        }
    }
    var _email:String{
        get{
            return email
        }set{
            email = newValue
        }
    }
    
}
