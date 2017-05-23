//
//  ItemDictionary.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/16/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class ItemDictionary{
    var list:[Item]!
    
    init(){
        print("Loading Items")
        list = []
        /*list = [Item(name: "Arrow", isWeapon: false, uses: 12, isArmor: false, isShield: false),
                Item(name: "Ironshield", isWeapon: false, uses: -1, isArmor: false, isShield: true),
                Item(name: "Leatherarmor", isWeapon: false, uses: -1, isArmor: true, isShield: false),
                Item(name: "Shortsword", isWeapon: true, uses: -1, isArmor: false, isShield: false),
                Item(name: "Longsword", isWeapon: true, uses: -1, isArmor: false, isShield: false),
                Item(name: "Bow", isWeapon: true, uses: -1, isArmor: false, isShield: false),
                Item(name: "Club", isWeapon: true, uses: -1, isArmor: false, isShield: false),
                Item(name: "Greatclub", isWeapon: true, uses: -1, isArmor: false, isShield: false)]*/
        list.append(Item(name: "Arrows", isWeapon: false, uses: 12, isArmor: false, isShield: false, cost: 5))
        list.append(Item(name: "Ironshield", isWeapon: false, uses: -1, isArmor: false, isShield: true, cost: 5))
        list.append(Item(name: "Leatherarmor", isWeapon: false, uses: -1, isArmor: true, isShield: false, cost: 10))
        list.append(Item(name: "Shortsword", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 10))
        list.append(Item(name: "Longsword", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 40))
        list.append(Item(name: "Bow", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 25))
        list.append(Item(name: "Club", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 5))
        list.append(Item(name: "Greatclub", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 30))
    }
    
    func getStats(name: String) -> Item{
        for i in list{
            if i.name == name{
                return i
            }
        }
        return list[0]
    }
}
