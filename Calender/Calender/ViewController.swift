//
//  ViewController.swift
//  Calender
//
//  Created by 이가영 on 2020/02/29.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
  

    @IBOutlet var calendar: FSCalendar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendar.allowsMultipleSelection = true
        calendar.clipsToBounds = true
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
    }

    

}

