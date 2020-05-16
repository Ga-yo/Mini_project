//
//  AlramrepeatViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class AlramrepeatViewController: UIViewController {

    var weak: [String] = ["일요일마다", "월요일마다", "화요일마다", "수요일마다", "목요일마다", "금요일마다", "토요일마다"]
    var count: Int = 0

    @IBOutlet weak var repeatTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        repeatTable.reloadData()
        // Do any additional setup after loading the view.
        self.repeatTable.delegate = self
        self.repeatTable.dataSource = self
    }
    

    
    @IBAction func backBtn(_ sender: UIBarButtonItem){
        repeatTable.reloadData()
        self.navigationController?.popViewController(animated: true)
    }

}

extension AlramrepeatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weak.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repeatTable.dequeueReusableCell(withIdentifier: "repeat", for: indexPath)
        
        cell.textLabel?.text = weak[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = repeatTable.cellForRow(at: indexPath){
            if cell.accessoryType == .none{
                cell.accessoryType = .checkmark
                cell.isSelected = true
//                print(Alram[0].repeatAlram[0]) //매일
//                print(Alram[1].repeatAlram[0]) //X
                
//                Alram[1].repeatAlram[count] = weak[indexPath.row]
//                count+=1
            }
        }
        
        
    }
}

