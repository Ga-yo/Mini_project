//
//  TimerViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var structTime: TimerMD = TimerMD()
    var isTimer: Bool = true
    
    @IBOutlet weak var timeCheck: UIDatePicker!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var showTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func chooseTime(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.dateFormat = "HH:mm:ss"
        self.showTime.text = dateFormatter.string(from: sender.date)
        structTime.counter = dateFormatter.date(from: self.showTime.text!)!
        print(dateFormatter.date(from: dateFormatter.string(from: sender.date))!)
        //structTime.counter = dateFormatter.date(from: sender.date)!)
        print(dateFormatter.string(from: sender.date))
    }
    
    @IBAction func startTime(_ sender: UIButton){
        if isTimer{
            timeCheck.isEnabled = false
            changeButton(startBtn, "재개")
            structTime.timerTime = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(repeatTime), userInfo: nil, repeats: true)
            isTimer = false
        }else{
            changeButton(startBtn, "일시정지")
            structTime.timerTime.invalidate()
            isTimer = true
        }
    }
    
    @IBAction func cancelTime(_ sender: UIButton){
        structTime.counter = Date()
        structTime.timerTime = Timer()
        self.showTime.text = "00.00"
        self.isTimer = true
        timeCheck.isEnabled = true
    }
    
    @objc func repeatTime(){
        //제대로 카운트하게해야함
        structTime.counter -= 0.035
        showTime.text = "\(structTime.counter)"
    }
    
    func changeButton(_ button: UIButton, _ title: String){
           print("왕")
           button.setTitle(title, for: .normal)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
