//
//  ViewController.swift
//  Hello_World
//
//  Created by 이가영 on 2020/02/17.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var exchanged: UILabel!
    
    @IBOutlet weak var scan: UITextField!
    
    @IBAction func send(_ sender: UIButton) {
        exchanged.text = "Hello" + scan.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

