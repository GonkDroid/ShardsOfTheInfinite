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
    var type:Enemy! = nil
    
    var armorList = ArmorDictionary()
    var weaponList = WeaponDictionary()
    var enemylist = EnemyDictionary()
    
    init(race: String){
        super.init()
        type = enemylist.getStats(name: race)
        self.currentWeapon = type.currentWeapon
        self.currentVis = type.currentVis
        self.currentHp = type.currentHp
        self.maxHp = type.maxHp
        self.maxVis = type.maxVis
        self.evasion = type.evasion
        self.magicAttack = type.magicAttack
        self.defense = type.defense
        self.currentArmor = type.currentArmor
    }
}
