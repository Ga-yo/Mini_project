//
//  ViewController.swift
//  AlarmApp
//
//  Created by 이가영 on 2020/02/12.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var isclickconfirm = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }
    
    @IBOutlet var current: UILabel!
    @IBOutlet var choose: UILabel!
    
    @IBAction func changedatePicker(_ sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        choose.text = formatter.string(from: sender.date)
    }

    @objc func updateTime(){

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        current.text = formatter.string(from: Date())
        
        if isclickconfirm {
            return
        }
        
        if choose.text == current.text {
            self.isclickconfirm = true
            
            Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.timerOn), userInfo: nil, repeats: false)
            // 60초 뒤에 실행
            
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in self.isclickconfirm = true
                Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.timerOn), userInfo: nil, repeats: false)
                })
                self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func timerOn() {
           isclickconfirm = false // 초기화
       }
}

