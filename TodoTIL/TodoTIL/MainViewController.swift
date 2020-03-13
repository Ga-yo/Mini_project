//
//  MainViewController.swift
//  TodoTIL
//
//  Created by 이가영 on 2020/03/12.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

var list = [User]()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func saveAllData() { //data 저장
             let data = list.map {
                 [
                     "Name": $0.name,
                     "adress": $0.adress,
                     "description": $0.description,
                     "time" : $0.time
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
                var title = $0["Name"] as? String
                var content = $0["adress"] as? String
                var isComplete = $0["description"] as? String
                var time = $0["time"] as? String
                
                return User(name: title!, adress: content!, description: isComplete!, time: time!)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        loadAllData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveAllData()
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TodoTableViewCell
        
        cell.nameLabel.text = list[indexPath.row].name
        cell.adressLabel.text = list[indexPath.row].adress
        cell.whereLabel.text = list[indexPath.row].time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
        
    }
}
