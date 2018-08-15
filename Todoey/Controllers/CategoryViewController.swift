//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Krystian Chrobok on 11/08/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categories = [Category]()
    
    let contextCategory = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()
    }



    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryLine = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        categoryLine.textLabel?.text = categories[indexPath.row].name
        
        return categoryLine
        
    }
    
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   if segue.identifier == "goToItems" {
            let destinationVC = segue.destination as! TodoListViewController
            
            //zaeby nie ladowalo wszyskich item i wyswietlato tylko tych w danej kategorii, wiepierw musze sprawdzic jaka kategorie ktos trigger i tylko te items zaladowac do itemArray w TodoListViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories[indexPath.row]
            }
//        } else {
//            print("inny sequey mozna tu dodac")
//        }
    }
    
    
    //MARK: - Data Manipulation Methods
    
    func saveCategoty() {
        
        do {
            try contextCategory.save()
        } catch {
            print("Error saving Category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try contextCategory.fetch(request)
        } catch {
            print("Error fetching data from contex \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    //MARK: - Add new category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Create Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category(context: self.contextCategory)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            self.saveCategoty()
            
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










