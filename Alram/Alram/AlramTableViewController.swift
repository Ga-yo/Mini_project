//
//  AlramTableViewController.swift
//  Alram
//
//  Created by 이가영 on 2020/05/11.
//  Copyright © 2020 이가영. All rights reserved.
//


import UIKit

var Alram = [AlramMD]()
var clockdata: String?
var dayCell: [String] = []

class AlramTableViewController: UITableViewController {

    //var abc: [String] = ["A", "B", "C", "D", "E"]
    
    @IBOutlet weak var plusBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Alram.append(AlramMD(clock: "08:10 AM", repeatAlram: ["매일"], isInsert: true))
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alram.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AlramTableViewCell = tableView.dequeueReusableCell(withIdentifier: "alramlistCel", for: indexPath) as! AlramTableViewCell
       
        //Alram[indexPath.row].clock = clockdata ?? "08:15"
        //이거 떄문에 리스트 안뜸
        
        print("\(indexPath.row)")
        
        if indexPath.row > 1 {
            print(Alram[1].clock)
            print(Alram[0].clock)
        }
        
        cell.clockLabel.text = Alram[indexPath.row].clock
        
//        if cell.onoffAlram.isOn {
//            print("알람 on")
//        }else{
//            print("알람r off")
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
