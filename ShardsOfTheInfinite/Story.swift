//
//  Story.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/15/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import Foundation

class Story{
    var playerInventory:[Item]!
    var playerEquiped:[Item]!
    let entities = EnemyDictionary()
    let items = ItemDictionary()
    let weapons = WeaponDictionary()
    let armors = ArmorDictionary()
    let shields = ShieldDictionary()
    
    func startAdventure(){
        var player = Player(race: "Humanplayer")
        playerEquiped.append(Item(name: "Fists", isWeapon: true, uses: -1, isArmor: false, isShield: false))
        if player.type.name != "Human"{
            self.placeholderLocation()
        }
        else{
            tavernLocation(playerEntity: player)
        }
    }
    
    
    func combat(offenseEntity: Entity, defenseEntity: Entity, blocked: Bool, usedMagic: Bool){
        let magicHit = 60
        if(blocked){
            let blockingEvade = defenseEntity.type.evasion + defenseEntity.currentWeapon.blockingDefense
            if(usedMagic){
                var damage = offenseEntity.type.magicAttack - (defenseEntity.type.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = magicHit - blockingEvade
                let roll = Int(arc4random_uniform(100))
                
                offenseEntity.useVis(amount: 1)
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll >= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
            else {
                var damage = offenseEntity.currentWeapon.damage - (defenseEntity.type.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = offenseEntity.currentWeapon.hitChance - blockingEvade
                let roll = Int(arc4random_uniform(100))
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll >= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
        }
        else{
            if(usedMagic){
                var damage = offenseEntity.type.magicAttack - (defenseEntity.type.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = magicHit - defenseEntity.type.evasion
                let roll = Int(arc4random_uniform(100))
                
                offenseEntity.useVis(amount: 1)
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll >= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
            else {
                var damage = offenseEntity.currentWeapon.damage - (defenseEntity.type.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = offenseEntity.currentWeapon.hitChance - defenseEntity.type.evasion
                let roll = Int(arc4random_uniform(100))
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll >= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
        }
    }
    
    func placeholderLocation(){
        print("You did something wrong")
    }
    
    func tavernLocation(playerEntity: Player){
        
    }
    
}
