//
//  stopWatchViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class stopWatchViewController: UIViewController {

    var StopWatch: stopWatch = stopWatch()
    var LapWatch: stopWatch = stopWatch()
    
    var isPlay: Bool = true //시작
    var saveTime: [Double] = []
    var cellCount: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customButton(startButton)
        customButton(lapButton)
    }
    @IBAction func pressStart(_ sender: UIButton){
        if isPlay { //시작버튼을 누르면
            StopWatch.time = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(repeatTime), userInfo: nil, repeats: true)
            
            isPlay = false
            
            changeButton(startButton, "Stop")
            changeButton(lapButton, "Lap")


        }else{ //스탑버튼을 누르면
            StopWatch.time.invalidate()
            isPlay = true
            
            changeButton(startButton, "Start")
            changeButton(lapButton, "Reset")
        }
    }
    
    @IBAction func pressLap(_ sender: UIButton){
        if !isPlay{
            saveTime.append(StopWatch.count)
            tableView.reloadData()
            isPlay = false
        }else{
            StopWatch.time.invalidate()
            timeLabel.text = "00:00.00"
            StopWatch.count = 0.0
            saveTime.removeAll()
            tableView.reloadData()
        }
    }
    
    func changeButton(_ button: UIButton, _ title: String){
        print("왕")
        button.setTitle(title, for: .normal)
    }
    
    func customButton(_ button: UIButton){
        button.layer.cornerRadius = 100
        button.layer.borderColor = UIColor.black.cgColor
        
        if isPlay{
            button.backgroundColor = UIColor.red
        }else{
            button.backgroundColor = UIColor.blue
        }
    }
    
    @objc func repeatTime(){
        StopWatch.count = StopWatch.count + 0.035
        //String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
        
        let timerSave = stringFromTimeInterval(interval: StopWatch.count)
        
        timeLabel.text = timerSave as String
    }
    
    @objc func whenStopTime(){
        

        timeLabel.text = String(StopWatch.count)
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {

      let ti = NSInteger(interval)

        let ms = Int((interval.truncatingRemainder(dividingBy: 1) * 100))

      let seconds = ti % 60
      let minutes = (ti / 60) % 60

      return NSString(format: "%0.2d:%0.2d.%0.2d",minutes,seconds,ms)
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

extension stopWatchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopwatchCell", for: indexPath)
//
//        if indexPath.row == 0 {
//            cell.detailTextLabel?.text = "셀에 안들어옴"
//        } else {
//            cell.detailTextLabel?.text = "Lap \(StopWatch.count - (indexPath as NSIndexPath).row)"
//        }
//
        
        cell.textLabel?.text = String(format: "%.2f", saveTime[indexPath.row])
        
        return cell
    }
    
    
}

