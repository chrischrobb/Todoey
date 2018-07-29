//
//  ViewController.swift
//  Todoey
//
//  Created by Krystian Chrobok on 28/07/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggs", "Desroy Dragon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
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
  
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new TodoeyItem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks Add Item button on out UIAlert
            
            self.itemArray.append(textField.text!)
            //po dodaniu do tabeli musimy przeładować tabelę by wyswietlil sie nowy element dodany
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            //cloasure ktorym dodajemy tekst do tego field
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        //wywołujemy alert
        
        present(alert, animated: true, completion: nil)
        //pokazuje alert graficznie na ekranie wywoluje jego "pokazanie"
    }
    
    

}











