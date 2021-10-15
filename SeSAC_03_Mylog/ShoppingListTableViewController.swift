//
//  ShoppingListTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/13.
//

import UIKit



class ShoppingListTableViewController: UITableViewController {

    var dataArry: [shoppingList] = []{
        didSet{
            saveData()
        }
    }
    
    @IBOutlet weak var IsUserInputTf: UITextField!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        self.IsUserInputTf.placeholder = "무엇을 구매하실 건가요?"
    }

    func loadData(){
        let userD = UserDefaults.standard
        
        var shopdata = [shoppingList]()
        
        if let data = userD.object(forKey: "shopListCell") as? [[String:Any]]{
            for datum in data {
                guard let content = datum["checkList"] as? String else {return}
                shopdata.append(shoppingList(checkList: content))
            }
        }
    }
   
    
    
    func saveData(){
        var shopdata:[[String:Any]] = []
      
        
        for i in dataArry {
            let data: [String:Any] = [
                "checkList":i.checkList
            ]
            shopdata.append(data)
    }
        let userD = UserDefaults.standard
        userD.set(shopdata, forKey: "shopListCell")
        
        tableView.reloadData()
    
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
        
        cell.dataLabel.text = dataArry[indexPath.row].checkList
        // Configure the cell...
        cell.selectionStyle = .none

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        52
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if indexPath.section == 0 {
                if editingStyle == .delete {
                    dataArry.remove(at: indexPath.row)
                    tableView.reloadData()
                }
            }
        }
    @IBAction func AddCellBtn(_ sender: UIButton) {
        
        if let text = IsUserInputTf.text {
           let checkList = shoppingList(checkList: text)
            dataArry.append(checkList)
        } else {
            print("ERROR")
        }
    }
    
   
    
}
