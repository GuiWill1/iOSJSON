//
//  ItemCarrinho.swift
//  piFood
//
//  Created by Guilhermy William Andrade on 14/12/18.
//  Copyright © 2018 Guilhermy William Andrade. All rights reserved.
//

import Foundation

class ItemCarrinho{
    private var id:Int!
    private var quantidade:Int!
    private var produto:Produto!
    
    var _id:Int{
        get{
            return id
        }set{
            id = newValue
        }
    }
    var _quantidade:Int{
        get{
            return quantidade
        }set{
            quantidade = newValue
        }
    }
}
