//
//  ViewController.swift
//  todolist_firebase
//
//  Created by 이가영 on 2020/04/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var barbutton: UIBarButtonItem!
    
    var todo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addTodo(_ sender: UIBarButtonItem){
        
        let addAlert = UIAlertController(title: "새 알림 등록", message: "", preferredStyle: .alert)
        addAlert.addTextField{(mytextfield) in
            mytextfield.placeholder = "알람을 등록하세요."
        }
        
        let checkAlert = UIAlertAction(title: "확인", style: .default) { (action : UIAlertAction) in
        if let newTodo = addAlert.textFields?[0].text {
            print("입력할 할일 : \(newTodo)")
                self.todo.append(newTodo)
                self.tableView.reloadData()
            
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        addAlert.addAction(checkAlert)
        addAlert.addAction(cancelAction)
    
        
        self.present(addAlert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.todo[indexPath.row]
        
        return cell
    }
    
}
