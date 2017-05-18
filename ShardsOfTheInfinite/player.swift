//
//  Player.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/15/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Player: Entity{
    var shards:Int! = 0
    var coins:Int! = 0
    
    init(race: String){
        super.init()
        type = enemylist.getStats(name: race)
        currentWeapon = weaponList.getStats(name: type.heldWeapon)
        currentVis = type.vis
        currentHp = type.health
        maxHp = type.health
        maxVis = type.vis
    }
}
