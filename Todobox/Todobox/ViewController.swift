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
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTap))
    
    func saveAllData() { //data 저장
            let data = list.map {
                [
                    "title": $0.title,
                    "content": $0.content!,
                    "isComplete": $0.isComplete
                ]
            }
     
            let userDefaults = UserDefaults.standard
            userDefaults.set(data, forKey: "items") // 키, value 설정
            userDefaults.synchronize()  // 동기화
        }
    func loadAllData() {//data 불러오기
            let userDefaults = UserDefaults.standard
            guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]] else {
                return
            }
     
            print(data.description)
     
            // list 배열에 저장하기
            print(type(of: data))
            list = data.map {
                var title = $0["title"] as? String
                var content = $0["content"] as? String
                var isComplete = $0["isComplete"] as? Bool
     
                return TodoList(title: title!, content: content!, isComplete: isComplete!)
            }
        }


    @IBAction func Editbutton(_ sender: Any) {
        guard !list.isEmpty else {
            return
        }
        tableview.setEditing(true, animated: true)  // tableview editing 모드
      
        
        self.navigationItem.leftBarButtonItem = doneButton

    }
    
    @objc func doneButtonTap(){
        self.navigationItem.leftBarButtonItem = editButtonItem
        tableview.setEditing(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !list[indexPath.row].isComplete else{
            return
        }
        
        list[indexPath.row].isComplete = true
        
        let dialog = UIAlertController(title: "TodoList", message: "일을 완료했습니다!", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
        tableView.reloadData()
        
    }
    
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
     saveAllData()
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
        
        loadAllData()
        
        doneButton.style = .plain
        doneButton.target = self
        
        

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

