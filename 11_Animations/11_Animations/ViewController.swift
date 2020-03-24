//
//  ViewController.swift
//  11_Animations
//
//  Created by 이가영 on 2020/03/24.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let duration = 1.5

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position",
    "Color and Frame Change", "View Fade In", "Pop"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Animations"
    }

    override func viewWillAppear(_ animated: Bool) {
        animateTable()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailView = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            
            if let indexPath = indexPath {
                detailView.barTitle = self.items[(indexPath as NSIndexPath).row]
            }
        }
    }
    
    func animateTable() {
      tableView.reloadData()
      
      let cells = tableView.visibleCells
      let tableHeight = tableView.bounds.size.height
      
      // move all cells to the bottom of the screen
      for cell in cells {
        cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      }
      
      // move all cells from bottom to the right place
      var index = 0
      for cell in cells {
        UIView.animate(withDuration: duration, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
          cell.transform = CGAffineTransform(translationX: 0, y: 0)
          }, completion: nil)
        index += 1
      }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "Basic Animations"
    }
}
