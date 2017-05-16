//
//  ShieldDictionary.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/16/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class ShieldDictionary{
    var list:[Shield]!
    
    init(){
        list.append(Shield(evasion: 15, name: "Iron"))
        list.append(Shield(evasion: 50, name: "Adamantine"))
    }
}
