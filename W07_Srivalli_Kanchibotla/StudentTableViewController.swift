//
//  StudentTableViewController.swift
//  W07_Srivalli_Kanchibotla
//
//  Created by KANCHIBOTLA SRIVALLI  on 10/18/16.
//  Copyright © 2016 KANCHIBOTLA SRIVALLI . All rights reserved.
//

import UIKit
import CoreData
class StudentTableViewController: UITableViewController {
    
    var students : NSMutableSet?
    var x : NSArray?
    var cell : UITableViewCell?
    var count : Int = 0
    var incrementer = 0
    var viewTitle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewTitle
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
       // x = students!.allObjects as NSArray
        var i = -1
        
        for a in (students?.allObjects)!
        {
            
            i += 1
            if incrementer == i
            {
                // Configure the cell...
                let dt = (a as AnyObject).value(forKey: "studentID") as! Int
                cell.textLabel?.text = (a as AnyObject).value(forKey: "name") as? String //(courses[indexPath.row].value(forKey: "title") as! String)
                cell.detailTextLabel?.text = String(dt)//((a as AnyObject).value(forKey: "studentID") as? String)
                break
                
            }
            else
            {
                
                continue
            }
            
            
            
        }
        
        incrementer += 1

        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
