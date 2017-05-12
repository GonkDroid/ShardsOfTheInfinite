//
//  ViewController.swift
//  The Shards of the Infinite
//
//  Created by Mobile on 5/12/17.
//  Copyright © 2017 SBHS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var TextBox: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testing the commit function 
        TextBox.text = "As you walk forward down the mountain path, you notice a chest inside a bush. You open it, and find a glowing shard, two beers, and an axe."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

