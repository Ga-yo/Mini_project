//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by 이가영 on 2020/04/02.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import os.log

var meals = [Meal]()

class MealTableViewController: UITableViewController {
    
    private func loadSampleMeal(){
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "엽떡", photo: photo1, rating: 4) else{
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "덮밥", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "불닭게티", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
       @IBAction func unsindToMealList(_ sender: UIStoryboardSegue){
             if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
                
                //테이블 뷰의 행이 선택되어있는지 확인
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    meals[selectedIndexPath.row] = meal
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    let newIndexPath = IndexPath(row: meals.count, section: 0)
                       
                       meals.append(meal)
                    
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                   
                   // Add a new meal.
                   
                
               }
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadSampleMeal()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         super.prepare(for: segue, sender: sender)
           
           switch(segue.identifier ?? "") {
               
           case "AddItem":
               os_log("Adding a new meal.", log: OSLog.default, type: .debug)
               
           case "ShowDetail":
               guard let mealDetailViewController = segue.destination as? MealViewController else {
                   fatalError("Unexpected destination: \(segue.destination)")
               }
               
               guard let selectedMealCell = sender as? MealTableViewCell else {
                   fatalError("Unexpected sender: \(sender)")
               }
               
               guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                   fatalError("The selected cell is not being displayed by the table")
               }
               
               let selectedMeal = meals[indexPath.row]
               mealDetailViewController.meal = selectedMeal
               
           default:
               print("Unexpected Segue Identifier; \(segue.identifier)")
           }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            meals.remove(at: indexPath.row) //삭제!
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        // Configure the cell...

        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
