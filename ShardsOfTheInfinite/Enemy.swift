//
//  Enemy.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Enemy: Entity{
    var name:String! = ""
    var experienceWorth:Int! = 0
    var magicAttack:Int! = 0
    var coins:Int! = 0
    var lootLevel:Int! = 0
    
    init(name: String, weapon: String, experienceWorth: Int, health: Int, evasion: Int, defense: Int, vis: Int, magicAttack: Int, coins: Int, lootLevel: Int){
        super.init()
        self.name = name
        self.experienceWorth = experienceWorth
        maxHp = health
        currentHp = health
        self.evasion = evasion
        self.defense = defense
        maxVis = vis
        currentVis = vis
        self.magicAttack = magicAttack
        self.coins = coins
        self.lootLevel = lootLevel
        currentWeapon = weaponList.getStats(name: weapon)
    }
}
