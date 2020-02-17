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
    let left = UIImage(named: "combo.jpeg")
    let right = UIImage(named: "bboring.jpeg")
    
    var On = true
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBAction func honney(_ sender: UIButton) { //허니콤보와 엽떡을 먹을 때
        if (On == true) {
            let honney = UIAlertController(title: "경고", message: "이미 배달을 시켰습니다..", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                honney.addAction(onAction)
                present(honney, animated: true, completion: nil)
        } else {
            imageview.image = left
            On = true
        }
    }
    
    @IBAction func original(_ sender: UIButton) {
        let originaleat = UIAlertController(title: "엽떡 먹기", message: "엽떡을 먹겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니요, 그냥 엽떡만 먹을래요", style: UIAlertAction.Style.default, handler: {  ACTION in self.imageview.image = self.middle
                   self.On = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 허니콤보에 엽떡 보여주세요.", style: UIAlertAction.Style.default) { ACTION in self.imageview.image = self.left
            self.On = true
        }
        
        let eatAction = UIAlertAction(title: "네, 뿌링클이랑 먹겠습니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.imageview.image = self.right
            self.On = false
        })
        
        originaleat.addAction(offAction)
        originaleat.addAction(onAction)
        originaleat.addAction(eatAction)
        present(originaleat, animated: true, completion: nil)
    }
    
    @IBAction func bboring(_ sender: UIButton) {//뿌링클이랑 엽떡
        if On {
            let bboring = UIAlertController(title: "추가", message: "뿌링클을 같이 먹겠어요?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.imageview.image = self.right
                self.On = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            bboring.addAction(offAction)
            bboring.addAction(cancelAction)
            present(bboring, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = middle
    }


}

