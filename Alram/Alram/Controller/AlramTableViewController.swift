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
var alramName: String?

class AlramTableViewController: UITableViewController {

    //var abc: [String] = ["A", "B", "C", "D", "E"]
    lazy var doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTap(_:)))
    
    @IBOutlet weak var plusBtn: UIBarButtonItem!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alram.append(AlramMD(clock: "08:10 AM", name: "학교가야지", isInsert: true))
        
        doneBtn.style = .plain
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func EditBtn(){
        self.navigationItem.leftBarButtonItem = editBtn

        guard !Alram.isEmpty else {
            return
        }
        
        plusBtn.isEnabled = false
        tableView.setEditing(true, animated: true)
        self.navigationItem.leftBarButtonItem = doneBtn
    }
    
    @objc private func doneBtnTap(_ sender: Any){
        print("수정모드 끝")
        self.navigationItem.leftBarButtonItem = editBtn
        plusBtn.isEnabled = true
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

        cell.clockLabel.text = Alram[indexPath.row].clock
        
        if cell.onoffAlram.isOn {
            Alram[indexPath.row].isInsert = true
        }else{
            Alram[indexPath.row].isInsert = false
        }
        
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
