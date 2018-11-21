//
//  ViewController.swift
//  JJSocketManager
//
//  Created by snailjj on 11/21/2018.
//  Copyright (c) 2018 snailjj. All rights reserved.
//

import UIKit
import JJSocketManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(GCDSocketManager.shared)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

