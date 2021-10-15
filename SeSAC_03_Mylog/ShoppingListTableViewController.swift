//
//  ShoppingListTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/13.
//

import UIKit

var dataArry: [String] = ["test","test2","test3","test4"]

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet weak var IsUserInputTf: UITextField!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        self.IsUserInputTf.placeholder = "무엇을 구매하실 건가요?"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Shopping List"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArry.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingList", for: indexPath) as! ShoppingListTableViewCell
        
        cell.dataLabel.text = dataArry[indexPath.row]
        // Configure the cell...
        cell.selectionStyle = .none

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        52
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArry.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
        }
    }
    
    @IBAction func AddCellBtn(_ sender: UIButton) {
        if IsUserInputTf.text != nil {
           
            dataArry.append("\(IsUserInputTf.text!)")
            tableView.reloadData()
        }
    }
    
   
    
}
