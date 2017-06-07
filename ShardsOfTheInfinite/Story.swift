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
    
//    var choiceButton1 = UIButton()
//    var choiceButton2 = UIButton()
//    var choiceButton3 = UIButton()
    
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    @IBOutlet var vText: UITextView!
    
    
    //var vText = UITextView()
    
    var choiceButtons:[UIButton] = []
    var commenceFighting = 0
    
    let ArrestEnding = "You awake and find yourself in jail. Your adventure will continue no further. You will spend the rest of your days working in the iron mines."
    
    
    override func viewDidLoad(){
//        let width = view.bounds.width
//        let height = view.bounds.height
//        choiceButton1 = UIButton(frame: CGRect(x: -(width/2), y: -(height/2), width: width/3, height: width/6))
//        choiceButton1.setTitle("Choice 1", for: .normal)
//        choiceButton1.tag = 1
//        choiceButton2 = UIButton(frame: CGRect(x: -(width/2)+(width/3), y: -(height/2), width: width/3, height: width/6))
////        choiceButton2 = UIButton(frame: CGRect(x: 0, y: 0, width: width/3, height: width/6))
//        choiceButton2.setTitle("Choice 2", for: .normal)
//        choiceButton2.tag = 2
//        choiceButton3 = UIButton(frame: CGRect(x: -(width/2)+(2*width/3), y: -(height/2), width: width/3, height: width/6))
//        choiceButton3.setTitle("Choice 3", for: .normal)
//        choiceButton3.tag = 3
//        choiceButtons.append(choiceButton1)
//        choiceButtons.append(choiceButton2)
//        choiceButtons.append(choiceButton3)
//        for i in choiceButtons{
//            i.setTitleColor(.black, for: .normal)
//            i.addTarget(self, action: #selector(choiceChosen), for: .touchUpInside)
//            view.addSubview(i)
//        }
//        vText = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: height/2))
//        self.automaticallyAdjustsScrollViewInsets = false
//        vText.center = self.view.center
//        vText.textAlignment = NSTextAlignment.justified
//        vText.textColor = .black
//        view.addSubview(vText)
//        vText = vText.text
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
        enemies[0].currentHp = enemies[0].maxHp
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
        if commenceFighting == 1{
            add(str: " The man falls at your feet, exhausted and passes out, as everyone else’s heads turn away back to their drinks and the adrenalin coursing through you dies down, you see that out of the man’s tunic falls a hefty pouch of gold.")
        }
    }
    
    func placeholderLocation(){
        print("You did something wrong")
    }
    
    func tavernLocation(playerEntity: Player){
        vText.text = ""
        add(str: "After a long day of grueling work the apprentice of a fletcher, you find yourself relaxing in the back of a tavern. [Tavern Background Appears] It’s a small, homely place, and the air is filled with the smell of the owner’s cooking wafting throughout and the  voices of your neighbors making merry. The place is packed to the brim at this hour, and some people tend to get drunk quickly. You wait for the inevitable fight to break out. A bright red faced man stumbles toward your table.'The frumgpfm diyasay ‘bout me muva.'")
            add(str: "Choice 1: Say Nothing, Choice 2: Stand up and use your height to intimidate him, or Choice 3: Try to calm the drunkard.")
            showButtons(show: true)
            while(commenceFighting != 1){
            }
            encounter(enemies: [entities.getStats(name: "Drunkman")], playerEntity: player)
        
        }
    
    
    func choiceChosen(_ sender: UIButton) {
            let choiceSet = sender.tag/3
            let choiceNumber = sender.tag%3
            if choiceSet <= 1{
                if choiceNumber == 1{
                    add(str: "The man is incomprehensible, it’s best to ignore him.'Oi, don effin’ ignore me!'The man lurches toward you while throwing a very shoddy haymaker. You simply move your head and his punch goes wide. You stand up and get ready for a fight.")
                }
                else if choiceNumber == 2{
                    add(str: "The man is smaller than you are, you think that he might back off if you stand up to your full height and stand your ground. 'Back off before you get hurt.'The man’s demeanor remains unchanged. 'Take this!'he yells, as he takes a wide swing at you. You take a step back and his swing passes harmlessly in front of your face. You see the opportunity present itself and go to strike back.")
                }
                else if choiceNumber == 0{
                    add(str: "You have no quarrel with this man, it’s probably best to explain to him that you have never met him before. 'I don’t believe that we’ve met before…' Your voice trails off as he yells something even less comprehensible and goes to take a swing at you. You had hoped to avoid this, but nonetheless you ready yourself for a fight.")
                }
                commenceFighting = 1
                for i in choiceButtons{
                    i.tag += 3
                }
            }
            else if choiceSet <= 2{
                if choiceNumber == 1{
                    add(str: "This man is clearly a drunk, you’re helping him by taking the money he uses to fuel his addiction. You pocket the pouch (You gain 15 gold). Luckily, no one seems to notice.")
                    player.coins += 15
                }
                if choiceNumber == 2{
                    add(str: "The man was only drunk, drinking isn’t a crime. You have no further business with the man that lay unconscious in front of you, you turn and walk away.")
                }
                if choiceNumber == 0{
                    add(str: "This man committed a grave offense against you, he will never make the same mistake again. You pull out your knife and run it across his throat. You hear screams of pure terror around you as he coughs and splutters up his own blood. You are immediately tackled by a nearby guard and relieved of your blade as you feel a sharp pain in the back of your head and consciousness fades from you.")
                    jailEnd()
                }
            }
            showButtons(show: false)
        }
        
        func showButtons(show: Bool){
            for i in choiceButtons{
                i.isHidden = !show
            }
        }
        
        func add(str: String){
            vText.text.append(str)
        }
        
        func jailEnd(){
            add(str: ArrestEnding)
            //gameOver.isHidden = false
            //jailEndText.isHidden = false
        }

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
