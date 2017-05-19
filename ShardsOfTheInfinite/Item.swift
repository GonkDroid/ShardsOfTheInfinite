//
//  Item.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/16/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Item{
    var name:String! = ""
    var isWeapon:Bool! = false
    var uses:Int! = -1
    var isArmor:Bool! = false
    var isShield:Bool! = false
    var cost:Int! = 0
    
    init(name: String, isWeapon: Bool, uses: Int, isArmor: Bool, isShield: Bool, cost: Int){
        self.name = name
        self.isWeapon = isWeapon
        self.uses = uses
        self.isArmor = isArmor
        self.isShield = isShield
        self.cost = cost
    }
}
