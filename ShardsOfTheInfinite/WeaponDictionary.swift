//
//  WeaponDictionary.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class WeaponDictionary{
    var list:[Weapon]!
    
    init(){
        list.append(Weapon(name: "Fists", damage: 1, hitChance: 95, blockingDefense: 10))
        list.append(Weapon(name: "Shortsword", damage: 4, hitChance: 60, blockingDefense: 15))
        list.append(Weapon(name: "Longsword", damage: 8, hitChance: 50, blockingDefense: 20))
        list.append(Weapon(name: "Shortbow", damage: 6, hitChance: 65, blockingDefense: 5))
        list.append(Weapon(name: "Club", damage: 4, hitChance: 50, blockingDefense: 10))
        list.append(Weapon(name: "Greatclub", damage: 8, hitChance: 40, blockingDefense: 20))
    }
    
    func getStats(name: String) -> Weapon{
        for i in list{
            if i.name == name{
                return i
            }
        }
        return list[0]
    }
}
