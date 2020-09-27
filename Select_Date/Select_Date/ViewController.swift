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
    var isclickconfirm = false //alert이 눌렸는지 확인
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }
    
    @IBOutlet var current: UILabel! //현재 시간
    @IBOutlet var choose: UILabel!  //선택 시간
    
    @IBAction func changedatePicker(_ sender: UIDatePicker){ // datepicker를 이용해 데이터 값을 바꿧을 때 action
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        choose.text = formatter.string(from: sender.date)
    }

    @objc func updateTime(){  // 얼럿 확인 버튼이 눌렸으면(true), 종료
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        current.text = formatter.string(from: Date())
        
        if isclickconfirm {
            return
        }
        
        if choose.text == current.text { //현재 시간과 선택한 시간이 같으면
            self.isclickconfirm = true
            
            Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.timerOn), userInfo: nil, repeats: false)
            // 60초 뒤에 실행
            
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: .alert)//alert을 띄워 알림창뜨게 하기
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in self.isclickconfirm = true
                Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.timerOn), userInfo: nil, repeats: false) //60초 후에 다시 알람이 뜨는
                })
                self.present(alert, animated: true, completion: nil) //실행
        }
    }
    
    @objc func timerOn() {
           isclickconfirm = false // 초기화
       }
}

