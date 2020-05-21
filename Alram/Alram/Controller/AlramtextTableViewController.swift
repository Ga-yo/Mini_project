//
//  AlramtextTableViewController.swift
//  Alram
//
//  Created by 이가영 on 2020/05/19.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AlramtextTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview?.reloadData()
        
        self.tableview?.delegate = self
        self.tableview?.dataSource = self
    }

    @IBAction func cancelBtn(_ sender: UIBarButtonItem){
        tableview.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NameTableViewCell = tableview.dequeueReusableCell(withIdentifier: "alramName", for: indexPath) as! NameTableViewCell
        
        alramName = cell.textfield.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
