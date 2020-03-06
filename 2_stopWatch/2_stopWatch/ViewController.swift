//
//  ViewController.swift
//  2_stopWatch
//
//  Created by 이가영 on 2020/03/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    let mainTime: structTime = structTime()
    var isPlay: Bool = false

    override func viewDidLoad() {
    super.viewDidLoad()

    }

    @IBAction func startButton(_ sender: Any) {
        if !isPlay {
            //Start 버튼이면
            mainTime.time = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlay = true
            changeButton(startButton, title: "Stop", color: UIColor.blue)
        } else {
            //Stop 버튼이면
            startButton.isEnabled = true
            mainTime.time.invalidate()
            isPlay = false
            changeButton(startButton, title: "Start", color: UIColor.black)
        }
    }

    @IBAction func resetButton(_ sender: Any) {
        mainTime.time.invalidate()
        mainTime.count = 0.0
        resetButton.isEnabled = true
        timeLabel.text = "00.00"
    }

    func changeButton(_ button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(color, for: UIControl.State())
    }

    @objc func UpdateTimer() {
        mainTime.count = mainTime.count + 0.035
        timeLabel.text = String(format: "%.2f", mainTime.count)
    }

}
