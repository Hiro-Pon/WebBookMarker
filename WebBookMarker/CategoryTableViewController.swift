//
//  AddCategoryTableViewController.swift
//  WebBookMarker
//
//  Created by 中嶋裕也 on 2018/05/09.
//  Copyright © 2018年 中嶋裕也. All rights reserved.
//

import UIKit

class AddCategoryTableViewController: UITableViewController {
    
    let CategoryData = UserDefaults.standard
    var CategoryArray:[String] = []
    
    @IBAction func abd() {
        let alert: UIAlertController = UIAlertController(title:  "Input Category", message: "入力してください", preferredStyle: UIAlertControllerStyle.alert)
        
        let CancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            //キャンセルアクション
            (action:UIAlertAction!) -> Void in
        })
        let DoneAction:UIAlertAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: {
            (action:UIAlertAction!) -> Void in
            
            //OKアクション
            if alert.textFields != nil {
                
                if UserDefaults.standard.object(forKey: "CATEGORY") != nil {
                    self.CategoryArray = UserDefaults.standard.object(forKey: "CATEGORY") as! [String]
                }
                
                self.CategoryArray.append(alert.textFields![0].text!)
                
                self.CategoryData.set(self.CategoryArray, forKey: "CATEGORY")
                
                self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
                self.tableView.reloadData()
            }
        })
        
        alert.addAction(CancelAction)
        alert.addAction(DoneAction)
        
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
            text.placeholder = "Category"
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if UserDefaults.standard.object(forKey: "CATEGORY") != nil {
            self.CategoryArray = UserDefaults.standard.object(forKey: "CATEGORY") as! [String]
        }
        
        
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.reloadData()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return CategoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        cell.Name.text = CategoryArray[indexPath.row]
    
        return cell
    }
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deletebutton:UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
//            self.CategoryArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
