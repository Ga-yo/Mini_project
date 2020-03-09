//
//  ViewController.swift
//  2_stopWatch
//
//  Created by 이가영 on 2020/03/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    @IBOutlet weak var tableViewCell: UILabel!
    
    override func prepareForReuse() { super.prepareForReuse()
        tableViewCell.text = "\(lapTime)"
    }

}

let mainTime: structTime = structTime()
let lapTime: structTime = structTime()
var isPlay: Bool = false
var laps: [String] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var tableview: UITableView!

    var cellIdentifier = "Cell"
    override func viewDidLoad() {
    super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }

    @IBAction func startButton(_ sender: AnyObject) {

        if !isPlay {
            //Start 버튼이면
            mainTime.time = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            lapTime.time = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlay = true
            changeButton(startButton, title: "Stop", color: UIColor.blue)
        } else {
            //Stop 버튼이면
            startButton.isEnabled = true
            mainTime.time.invalidate()
            lapTime.time.invalidate()
            isPlay = false
            changeButton(startButton, title: "Start", color: UIColor.black)
        }
    }

    @IBAction func resetButton(_ sender: AnyObject) {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! customCell
        let text: String = "\(lapTime.time)"
        cell.tableViewCell?.text = text

        return cell
    }

}
