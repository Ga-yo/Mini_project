//
//  SecondViewController.swift
//  Calender
//
//  Created by 이가영 on 2020/02/29.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
      let cellIdentifier = "Cell"
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 5
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
          
          return cell
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
