//
//  ViewController.swift
//  Todobox
//
//  Created by 이가영 on 2020/02/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
 
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
    }


}

