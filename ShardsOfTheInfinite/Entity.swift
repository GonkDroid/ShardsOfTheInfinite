//
//  Entity.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Entity: NSObject{
    var currentHp:Int!
    var maxHp:Int!
    var currentWeapon:Weapon!
    var currentVis:Int! = 0
    var maxVis:Int!
    var type:Enemy!
    
    var weaponList = WeaponDictionary()
    var enemylist = EnemyDictionary()
    
    init(race: String){
        type = enemylist.getStats(name: race)
        currentWeapon = weaponList.getStats(name: type.heldWeapon)
        currentVis = type.vis
        currentHp = type.health
        maxHp = type.health
        maxVis = type.vis
    }
    
    func reduceHP(amount: Int){
        currentHp = currentHp - amount
    }
    
    func useVis(amount: Int){
        currentVis = currentVis - amount
    }
}
