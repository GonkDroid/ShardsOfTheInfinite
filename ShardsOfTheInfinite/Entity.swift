//
//  Entity.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Entity: NSObject{
    var currentHp:Int! = 0
    var maxHp:Int! = 0
    var currentWeapon:Weapon!
    var currentVis:Int! = 0
    var maxVis:Int! = 0
    var currentArmor:Armor!
    var evasion:Int! = 0
    var defense:Int! = 0
    var magicAttack:Int! = 0
    
    func reduceHP(amount: Int){
        currentHp = currentHp - amount
    }
    
    func useVis(amount: Int){
        currentVis = currentVis - amount
    }
}
