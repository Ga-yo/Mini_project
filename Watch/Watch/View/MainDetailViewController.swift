//
//  MainDetailViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController {
    var structWorld: WorldMD = WorldMD()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }
    
}

extension MainDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeZone.knownTimeZoneIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldArray", for: indexPath)
        
        cell.textLabel?.text = TimeZone.knownTimeZoneIdentifiers[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        structWorld.numberOfWorld = indexPath.row
        structWorld.worldName = TimeZone.knownTimeZoneIdentifiers[structWorld.numberOfWorld]
        structWorld.isSelected = true
        self.navigationController?.popViewController(animated: true)
    }
}
