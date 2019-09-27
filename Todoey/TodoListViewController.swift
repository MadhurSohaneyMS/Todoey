//
//  ViewController.swift
//  Todoey
//
//  Created by Madhur Sohaney on 9/13/19.
//  Copyright © 2019 Madhur Sohaney. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray [indexPath.row]
        return cell
    }

    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        
            var alertTextResult = UITextField()
        
            let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
            let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
                //What will happen when the user clicks the Itme button over our UIAlert
                self.itemArray.append(alertTextResult.text!)
                self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new item"
            alertTextResult = alertTextfield
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

