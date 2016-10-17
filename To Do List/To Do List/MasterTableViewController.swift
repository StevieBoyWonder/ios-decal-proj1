//
//  MasterTableViewController.swift
//  To Do List
//
//  Created by Steven Holman on 10/16/16.
//  Copyright © 2016 Stevie. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    var tasks = [Thing]()
    
    
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        let timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: "clear", userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = tasks[indexPath.row].Title
        return cell
    }
    
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell!.accessoryType == .checkmark {
            cell!.accessoryType = .none
            self.tasks[indexPath.row].UnMarkDone()
        }
        else{
            cell!.accessoryType = .checkmark
            self.tasks[indexPath.row].MarkDone()
        }
    }
    
    func clear(){
        var log = [Int]()
        if self.tasks.count > 0{
            for i in 0...self.tasks.count-1{
                let x = self.tasks[i].CheckTime()
                if x{
                    log.append(i)
                }
                
            }
    
        }
        for item in log.reversed(){
            self.tasks.remove(at: item)
            
        }
        
    }
    

    
    

    


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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "final"{
            print("inside")
            let new = segue.destination as! FinalViewController
            var newList = [Thing]()
            for item in self.tasks{
                if item.Done == true {
                    newList.append(item)
                }
            
            }
            print(newList)
            new.shows = newList
            new.tableView.reloadData()
            
        }
        
    }
    

}
