//
//  Enemy.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Enemy{
    var name:String! = ""
    var experienceWorth:Int! = 0
    var health:Int! = 0
    var evasion:Int! = 0
    var defense:Int! = 0
    var vis:Int! = 0
    var magicAttack:Int! = 0
    var coins:Int! = 0
    var lootLevel:Int! = 0
    
    init(name: String, experienceWorth: Int, health: Int, evasion: Int, defense: Int, vis: Int, magicAttack: Int, coins: Int, lootLevel: Int){
        self.name = name
        self.experienceWorth = experienceWorth
        self.health = health
        self.evasion = evasion
        self.defense = defense
        self.vis = vis
        self.magicAttack = magicAttack
        self.coins = coins
        self.lootLevel = lootLevel
    }
    
    func enemyName() -> String{
        return name
    }
    
    func enemyExperienceWorth() -> Int{
        return experienceWorth
    }
    
    func enemyHealth() -> Int{
        return health
    }
    
    func enemyEvasion() -> Int{
        return evasion
    }
    
    func enemyDefense() -> Int{
        return defense
    }
    
    func enemyVis() -> Int{
        return vis
    }
    
    func enemyMagicAttack() -> Int{
        return magicAttack
    }
    
    func enemyCoins() -> Int{
        return coins
    }
    
    func enemyLootLevel() -> Int{
        return lootLevel
    }
}
