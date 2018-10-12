//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by 株式会社エンジ on 2018/10/12.
//  Copyright © 2018 tam. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    //MARK: Properties
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    // Cài đặt và hiện thị cells ở table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
 
    //MARK: Private Methods
    private func loadSampleMeals(){
        let photo1 = UIImage(named: "1")
        let photo2 = UIImage(named: "2")
        let photo3 = UIImage(named: "3")
        let photo4 = UIImage(named: "4")
        
        guard let meal1 = Meal(name: "Thit nuong", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal is null")
        }
        guard let meal2 = Meal(name : "Ga quay", photo: photo2, rating:3)else {
            fatalError("Unable to instantiate meal is null")
        }
        guard let meal3 = Meal(name : "Rau sao", photo: photo3,rating: 1)else {
            fatalError("Unable to instantiate meal is null")
        }
        guard let meal4 = Meal(name : "Thit cho", photo : photo4, rating: 0)else {
            fatalError("Unable to instantiate meal is null")
        }
        
        meals += [meal1,meal2,meal3,meal4]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
