//
//  ViewController.swift
//  Alert_app
//
//  Created by 이가영 on 2020/02/17.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let middle = UIImage(named: "original.jpeg")
    let left = UIImage(named: "허니콤보_엽떡.jpeg")
    let right = UIImage(named: "뿌링클_엽떡.jpeg")
    
    var On = true
    
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBAction func honney(_ sender: UIButton) { //허니콤보와 엽떡을 먹을 때
        if (On == true) {
            _ = UIAlertController(title: "경고", message: "이미 배달을 시켰습니다..", preferredStyle: UIAlertController.Style.alert)
            _ = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: { ACTION in self.imageview.image = self.middle
                self.On = false})
        }else {
            imageview.image = left
            On = true
        }
    }
    
    @IBAction func original(_ sender: UIButton) {
        
    }
    
    @IBAction func bboring(_ sender: UIButton) {//뿌링클이랑 엽떡
        if On {
            _ = UIAlertController(title: "추가", message: "뿌링클을 같이 먹겠어요?", preferredStyle: UIAlertController.Style.alert)
            _ = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.imageview.image = self.right })
        } else {
            imageview.image = right
            On = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = middle
    }


}

