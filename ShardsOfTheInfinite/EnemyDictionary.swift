//
//  EnemyDictionary.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class EnemyDictionary{
    var list:[Enemy]!
    
    init(){
        list = [Enemy(name: "Drunkenman", weapon: "Fists", experienceWorth: 1, health: 2, evasion: 0, defense: 0, vis: 0, magicAttack: 0, coins: 15, lootLevel: 0),
                Enemy(name: "Humanplayer", weapon: "Fists", experienceWorth: 0, health: 18, evasion: 25, defense: 0, vis: 1, magicAttack: 10, coins: 0, lootLevel: 0),
                Enemy(name: "Goblin", weapon: "Club", experienceWorth: 3, health: 10, evasion: 10, defense: 0, vis: 0, magicAttack: 0, coins: 5, lootLevel: 1),
                Enemy(name: "GoblinCaptian", weapon: "Greatclub", experienceWorth: 6, health: 40, evasion: 5, defense: 0, vis: 0, magicAttack: 0, coins: 15, lootLevel: 2)]
//        list.append(Enemy(name: "Drunkenman", weapon: "Fists", experienceWorth: 1, health: 2, evasion: 0, defense: 0, vis: 0, magicAttack: 0, coins: 15, lootLevel: 0))
//        list.append(Enemy(name: "Humanplayer", weapon: "Fists", experienceWorth: 0, health: 18, evasion: 25, defense: 0, vis: 1, magicAttack: 10, coins: 0, lootLevel: 0))
//        list.append(Enemy(name: "Goblin", weapon: "Club", experienceWorth: 3, health: 10, evasion: 10, defense: 0, vis: 0, magicAttack: 0, coins: 5, lootLevel: 1))
//        list.append(Enemy(name: "GoblinCaptian", weapon: "Greatclub", experienceWorth: 6, health: 40, evasion: 5, defense: 0, vis: 0, magicAttack: 0, coins: 15, lootLevel: 2))
    }
    
    func getStats(name: String) -> Enemy{
        for i in list{
            if i.name == name{
                return i
            }
        }
        return list[0]
    }
}
