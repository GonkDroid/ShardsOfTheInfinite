//
//  Player.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/15/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Player{
    var currentHp:Int!
    var maxHp:Int!
    var currentWeapon:Weapon!
    var currentVis:Int! = 0
    var maxVis:Int!
    var type:Enemy!
    
    var weaponList = WeaponDictionary()
    var enemylist = EnemyDictionary()
    
    init(){
        type = enemylist.getStats(name: "Humanplayer")
        currentWeapon = weaponList.getStats(name: type.heldWeapon)
        currentVis = type.vis
        currentHp = type.health
        maxHp = type.health
        maxVis = type.vis
    }
    
}
