//
//  AddViewController.swift
//  To Do List
//
//  Created by Steven Holman on 10/16/16.
//  Copyright © 2016 Stevie. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "Want"){
            let newCont = segue.destination as! MasterTableViewController
            let want:Thing = Thing(Title: titleTextField.text!)
            newCont.tasks.append(want)
            newCont.tableView.reloadData()
        
        }
        
    }
    

}
