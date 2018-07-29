//
//  ViewController.swift
//  Todoey
//
//  Created by Krystian Chrobok on 28/07/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggs", "Desroy Dragon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nie musismy w table view controller robic outler i action z tacjitego z e importujemy na gorze UITableViewontroller mamy wszystko juz w sobie samo sie dzieje w tej bibliotece, wszystko jest polaczone
       
    }

    //MARK - tableview datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
 

    //MARK - TableView Delegate Mathods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
  

}

