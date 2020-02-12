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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBOutlet var current: UILabel!
    @IBOutlet var choose: UILabel!
    
    @IBAction func changedatePicker(_ sender: UIDatePicker){
        let datepicker = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy - mm - dd HH:MM:SS: EEE"
        choose.text = "선택 시간 : " + formatter.string(from: datepicker.date)
    }

    @objc func updateTime(){
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy - mm - dd HH:MM:SS: EEE"
        
        current.text = "현재 시간 : " + formatter.string(from: date as Date)
    }
}

