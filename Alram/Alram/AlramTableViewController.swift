//
//  AlramTableViewController.swift
//  Alram
//
//  Created by 이가영 on 2020/05/11.
//  Copyright © 2020 이가영. All rights reserved.
//


import UIKit

var Alram = [AlramMD]()
var clockdata: String?
var dayCell: [String] = []
var indexpathRow: Int = 0 //repeatCell에서 필요한 변수

class AlramTableViewController: UITableViewController {

    //var abc: [String] = ["A", "B", "C", "D", "E"]
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnTap))
    
    @IBOutlet weak var plusBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alram.append(AlramMD(clock: "08:10 AM", repeatAlram: ["매일"], isInsert: true))
        
        doneBtn.style = .plain
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func EditBtn(){
        guard !Alram.isEmpty else {
            return
        }
        tableView.setEditing(true, animated: true)
        self.navigationItem.leftBarButtonItem = doneBtn
    }
    
    @objc func doneBtnTap(){
        self.navigationItem.leftBarButtonItem = editBtn
        tableView.setEditing(false, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alram.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AlramTableViewCell = tableView.dequeueReusableCell(withIdentifier: "alramlistCel", for: indexPath) as! AlramTableViewCell
        
        //Alram[indexPath.row].clock = clockdata ?? "08:15"
        //이거 때문에 삽질함.. 박제 ㅜ
        
        indexpathRow = indexPath.row
        
        print(indexPath.row)
        
        cell.clockLabel.text = Alram[indexPath.row].clock
        
//        if cell.onoffAlram.isOn {
//            print("알람 on")
//        }else{
//            print("알람r off")
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        Alram.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
