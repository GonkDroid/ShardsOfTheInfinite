//
//  ArmorDictionary.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/16/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class ArmorDictionary{
    var list:[Armor]!
    
    init(){
        print("Loading Armor")
        list = []
        /*list = [(Armor(name: "None", defense: 0)),
                (Armor(name: "Leather", defense: 3))]*/
        list.append(Armor(name: "None", defense: 0))
        list.append(Armor(name: "Leather", defense: 3))
        list.append(Armor(name: "Godly", defense: 100))
        list.append(Armor(name: "Latex", defense: -1))
    }
    
    func getStats(name: String) -> Armor{
        for i in list{
            if i.name == name{
                return i
            }
        }
        return list[0]
    }
}
