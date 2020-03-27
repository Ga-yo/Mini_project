//
//  ViewController.swift
//  12_Tumblr
//
//  Created by 이가영 on 2020/03/27.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
            // bug? exit segue doesn't dismiss so we do it manually...
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

