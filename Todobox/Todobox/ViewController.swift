//
//  ViewController.swift
//  Todobox
//
//  Created by 이가영 on 2020/02/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
var list = [TodoList]()
class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].content
        
        if list[indexPath.row].isComplete{
            cell.accessoryType = .checkmark //표준 액세서리 보기
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
 override func viewDidAppear(_ animated: Bool) {
     tableview.reloadData() // didload가 일회성이기 때문에 리로드해야함
 }
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        list.append(TodoList(title: "test1", content: "testData1"))
        list.append(TodoList(title: "test2", content: "testData2"))
    }


}

