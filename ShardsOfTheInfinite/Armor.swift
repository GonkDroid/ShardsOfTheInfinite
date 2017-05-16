//
//  Armor.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/16/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Armor{
    var defense:Int! = 0
    var name:String! = ""
    
    init(name: String, defense: Int){
        self.defense = defense
        self.name = name
    }
}
