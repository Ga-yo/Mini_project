//
//  ViewController.swift
//  Login
//
//  Created by 이가영 on 2020/03/01.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var logout: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 10
    }

}
