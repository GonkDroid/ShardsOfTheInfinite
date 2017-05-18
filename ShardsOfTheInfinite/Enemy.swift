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
    var health:Int! = 0
    var evasion:Int! = 0
    var defense:Int! = 0
    var vis:Int! = 0
    var magicAttack:Int! = 0
    var coins:Int! = 0
    var lootLevel:Int! = 0
    var heldWeapon:String!
    
    init(name: String, weapon: String, experienceWorth: Int, health: Int, evasion: Int, defense: Int, vis: Int, magicAttack: Int, coins: Int, lootLevel: Int){
        super.init()
        self.name = name
        self.experienceWorth = experienceWorth
        self.health = health
        self.evasion = evasion
        self.defense = defense
        self.vis = vis
        self.magicAttack = magicAttack
        self.coins = coins
        self.lootLevel = lootLevel
        self.heldWeapon = weapon
    }
}
