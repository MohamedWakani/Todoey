//
//  ViewController.swift
//  Todoey
//
//  Created by Hassan Elwakani on 1/4/2025.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["hello simo","waaahahaha","polo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // TableView-Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        var newItem = UITextField()
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            self.itemArray.append(newItem.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            newItem  = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

