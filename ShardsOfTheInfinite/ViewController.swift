//
//  ViewController.swift
//  ShardsOfTheInfinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Got to ViewDidLoad!")
    }

    
    @IBAction func fight(_ sender: UIButton) {
        let test = Story()
        test.encounter(enemies: [test.entities.getStats(name: "Drunkenman")], playerEntity: test.player)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

