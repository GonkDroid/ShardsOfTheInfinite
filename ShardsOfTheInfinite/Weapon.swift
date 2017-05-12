//
//  Weapon.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Weapon{
    var damage:Int! = 0
    var hitChance:Int! = 0
    var blockingDefense:Int! = 0
    var name:String! = ""
    
    init(name: String, damage: Int, hitChance: Int, blockingDefense: Int) {
        self.damage = damage
        self.hitChance = hitChance
        self.blockingDefense = blockingDefense
        self.name = name
    }
    
    func weaponDamage() -> Int{
        return damage
    }
    
    func weaponHitChance() -> Int{
        return hitChance
    }
    
    func weaponBlockingDefense() -> Int{
        return blockingDefense
    }
    func weaponName() -> String{
        return name
    }
}
