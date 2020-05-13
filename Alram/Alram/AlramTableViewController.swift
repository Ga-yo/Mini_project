//
//  AlramTableViewController.swift
//  Alram
//
//  Created by 이가영 on 2020/05/11.
//  Copyright © 2020 이가영. All rights reserved.
//


import UIKit

var Alram: AlramMD? 
var dayCell: [String] = []

class AlramTableViewController: UITableViewController {

    @IBOutlet weak var plusBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AlramTableViewCell = tableView.dequeueReusableCell(withIdentifier: "alramlistCel", for: indexPath) as! AlramTableViewCell
       
        cell.clockLabel.text = Alram?.clock
        
        if cell.onoffAlram.isOn {
            print("알람 on")
        }else{
            print("알람r off")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
