//
//  Story.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/15/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import UIKit

class Story: UIViewController{
    var playerInventory:[Item]! = []
    var playerEquiped:[Item]! = []
    let entities = EnemyDictionary()
    let items = ItemDictionary()
    let weapons = WeaponDictionary()
    let armors = ArmorDictionary()
    let shields = ShieldDictionary()
    var player = Player(race: "Humanplayer")
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBAction func startAdventure(){
//        var player = Player(race: "Humanplayer")
        playerEquiped.append(Item(name: "Fists", isWeapon: true, uses: -1, isArmor: false, isShield: false, cost: 0))
        if player.type.name != "Humanplayer"{
            self.placeholderLocation()
        }
        else{
            tavernLocation(playerEntity: player)
        }
    }
    
    
    func combat(offenseEntity: Entity, defenseEntity: Entity, blocked: Bool, usedMagic: Bool){
        let magicHit = 60
        if(blocked){
            let blockingEvade = defenseEntity.evasion + defenseEntity.currentWeapon.blockingDefense
            if(usedMagic){
                var damage = offenseEntity.magicAttack - (defenseEntity.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = magicHit - blockingEvade
                let roll = Int(arc4random_uniform(100))
                
                offenseEntity.useVis(amount: 1)
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll <= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
            else {
                var damage = offenseEntity.currentWeapon.damage - (defenseEntity.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = offenseEntity.currentWeapon.hitChance - blockingEvade
                let roll = Int(arc4random_uniform(100))
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll <= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
        }
        else{
            if(usedMagic){
                var damage = offenseEntity.magicAttack - (defenseEntity.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = magicHit - defenseEntity.evasion
                let roll = Int(arc4random_uniform(100))
                
                offenseEntity.useVis(amount: 1)
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll <= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
            else {
                var damage = offenseEntity.currentWeapon.damage - (defenseEntity.defense+defenseEntity.currentArmor.defense)
                if damage <= 0{
                    damage = 1
                }
                var hitChance = offenseEntity.currentWeapon.hitChance - defenseEntity.evasion
                let roll = Int(arc4random_uniform(100))
                
                if(hitChance < 15) {
                    hitChance = 15
                }
                
                if(roll <= hitChance){
                    defenseEntity.reduceHP(amount: damage)
                }
            }
        }
    }
    
    func encounter(enemies: [Entity], playerEntity: Player){
        var enemies = enemies
        var stillFighting = true
        var playerAttacking = true
        while(stillFighting){
            if enemies.count != 0{
                if playerAttacking{
                    self.combat(offenseEntity: playerEntity, defenseEntity: enemies[0], blocked: false, usedMagic: false)
                    print("Player HP: \(playerEntity.currentHp)  Enemy HP: \(enemies[0].currentHp)")
                    playerAttacking = false
                    if enemies[0].currentHp == 0{
                        print("Enemy Defeated!")
                        enemies.remove(at: 0)
                    }
                }
                else{
                    self.combat(offenseEntity: enemies[0], defenseEntity: playerEntity, blocked: false, usedMagic: false)
                    print("Player HP: \(playerEntity.currentHp)  Enemy HP: \(enemies[0].currentHp)")
                    playerAttacking = true
                }
            }
            else{
                stillFighting = false
            }
        }
    }
    
    func placeholderLocation(){
        print("You did something wrong")
    }
    
    func tavernLocation(playerEntity: Player){
        encounter(enemies: [entities.getStats(name: "Drunkenman")], playerEntity: player)
    }
    
    func changeText(string: String){
        testLabel.text = string
    }
    
    /*func shop(level: Int){
        var shopInventory = [Item]()
        if level == -1{
            shopInventory.append(items.getStats(name: "Shortsword"))
            shopInventory.append(items.getStats(name: "Ironshield"))
            shopInventory.append(items.getStats(name: "Bow"))
            shopInventory.append(items.getStats(name: "Arrows"))
        }
        func buyProduct(itemNum: Int){
            var product = shopInventory[itemNum-1]
            if player.coins < product.cost{
                //alert("You don't have enough gold for this!")
            }
            if product.isArmor{
                
            }
            else if product.isShield{
                
            }
            else if product.isWeapon{
                
            }
            else
        }
    }*/
    
}
