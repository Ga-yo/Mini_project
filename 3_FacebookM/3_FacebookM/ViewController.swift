//
//  ViewController.swift
//  3_FacebookM
//
//  Created by 이가영 on 2020/03/09.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    
    let imageview = UIImage(named: "JAEMIN.jpeg")
    let section0 = ["JAEMIN"]
    let section1 = ["Friends", "Event", "Group", "CMU", "Town Hall", "Instant Games", "see more.." ]
    let section2 = ["add favorites"]
    let section3 = ["log out"]
    let sectionTitle = ["Name", " ", "FAVORITES", " "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Facebook"
        navigationController?.navigationBar.barTintColor = UIColor.systemIndigo
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = UIColor.gray
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//섹션안에 있는 행 수
        switch section {
        case 0:
            return section0.count
        case 1:
            return section1.count
        case 2:
            return section2.count
        case 3:
            return section3.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        if indexPath.section == 0{
            cell.cellImage.image = imageview
            cell.cellLabel.text = section0[indexPath.row
]
        }else if indexPath.section == 1{
            cell.cellImage.isHidden = true
            cell.cellLabel.isHidden = true
        
            cell.textLabel?.text = section1[indexPath.row]
        }else if indexPath.section == 2{
            cell.cellImage.isHidden = true
            cell.cellLabel.isHidden = true
            
            cell.textLabel?.text = section2[indexPath.row]
            cell.textLabel?.textColor = .blue
            cell.accessoryType = .none
        }else if indexPath.section == 3{
            cell.cellImage.isHidden = true
            cell.cellLabel.isHidden = true
            
            cell.textLabel?.text = section3[indexPath.row]
            cell.textLabel?.textColor = .red
            cell.accessoryType = .none
        }
        
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
          return 72.0
        } else {
          return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
        
    }
//        cell.textLabel?.textAlignment = .center
//        cell.accessoryType = .none
//        cell.accessoryType = .disclosureIndicator
}

