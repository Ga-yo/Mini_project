//
//  ViewController.swift
//  14_ QuoraDots
//
//  Created by 이가영 on 2020/03/30.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dotone: UIImageView!
    @IBOutlet weak var dottwo: UIImageView!
    @IBOutlet weak var dotthree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Animate()
    }
    func Animate(){
        dotone.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dottwo.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dotthree.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.6,delay: 0.0, options: [.repeat, .autoreverse], animations: { //무한반복
            self.dotone.transform = CGAffineTransform.identity // 원상태로 복구
        }, completion: nil)
        UIView.animate(withDuration: 0.6,delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.dottwo.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.6,delay: 0.4, options: [.repeat, .autoreverse], animations: {
            self.dotthree.transform = CGAffineTransform.identity
        }, completion: nil)
    }

}

