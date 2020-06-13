//
//  MainViewController.swift
//  FirebaseExample
//
//  Created by 이가영 on 2020/06/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import Firebase
import SnapKit

class PeopleViewController: UIViewController {

    var arrayModel: [UserModel] = []
    var tableview: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
