//
//  MainViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/29.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

var structWorld: [WorldMD] = []

class MainViewController: UIViewController {
        
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var plusCell: UIBarButtonItem!
    @IBOutlet weak var editCell: UIBarButtonItem!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        let date: DateFormatter = DateFormatter()
        date.dateStyle = .none
        date.dateFormat = "HH:mm"
        print("tableview delegate, datasource")
    }
        
    override func viewWillAppear(_ animated: Bool) {
        print("tableview reloadData")
        tableview.reloadData()
        
        for i in 0..<structWorld.count{
            print(structWorld[i].worldClock + structWorld[i].worldName)
        }
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("셀의 개수 \(structWorld.count)")
        return structWorld.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "worldCell", for: indexPath)
        
        cell.textLabel?.text = structWorld[indexPath.row].worldClock
        cell.detailTextLabel?.text = structWorld[indexPath.row].worldName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
