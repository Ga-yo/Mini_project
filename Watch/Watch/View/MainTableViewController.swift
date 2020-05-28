//
//  MainTableViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var structWorld: WorldMD = WorldMD()
    
    @IBOutlet weak var plusCell: UIBarButtonItem!
    
    @IBOutlet weak var editCell: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCell", for: indexPath)
        
        let countryTime = TimeZone.knownTimeZoneIdentifiers[structWorld.numberOfWorld]
        if structWorld.isSelected {
            print("ahkd")
            cell.textLabel?.text = countryTime
            
            let date = DateFormatter()
            date.locale = Locale(identifier: countryTime)
            date.timeZone = TimeZone(identifier: countryTime)
            date.dateFormat = "HH:mm"

            cell.detailTextLabel?.text = date.string(from: Date())
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


