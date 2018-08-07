//
//  ViewController.swift
//  Todoey
//
//  Created by Krystian Chrobok on 28/07/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    //tu pokazujemy gdzie bedziemy zapisywac dane, bo nie chcemy zapisywac w defaults, odpoweidzianych za inne dane jak muzyke etc)
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    // pokazuje, gdzie zapisujemy dane lokalnie, item.plist nazwa bazy danych
    //print(dataFilePath)
    
    //let defaults = UserDefaults.standard
    //to uzycie standardowej amieci komputera wlasnej "piaskownicy" dla aplikacji unikatowej
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //let newItem = Item()
        //newItem.title = "Find Mike"
        //itemArray.append(newItem)
        
        //if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
        //    itemArray = items
        //}
        
        // tu jest przywołanie z pamieci przy ładowaniu biblioteki default, z założneim, że musi być if, zeby nie bylo crash jesli nie ma jeszcze takiej piaskonicy
        
        // nie musismy w table view controller robic outler i action z tacjitego z e importujemy na gorze UITableViewontroller mamy wszystko juz w sobie samo sie dzieje w tej bibliotece, wszystko jest polaczone
       
        loadItem()
        
    }

    //MARK - tableview datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // zmiana na zanaczenie i niezaznaczenie wyswietlania danych:
        //if itemArray[indexPath.row].done == true {
        //    cell.accessoryType = .checkmark
        //} else {
        //    cell.accessoryType = .none
        //}
        //powyzsze linijki kodu, mozemy zastapic jedna linijka tzw Ternry Operator, ktory wyglada tak:
        // wartosc = warunek ? wartoscGdyTrue : wartoscGdyFalse
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        
        return cell
    }
 

    //MARK - TableView Delegate Mathods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItem()
        
       // linijka powyżej zastępuje kod spod spodu, zmieniając bool na oposite
       // if itemArray[indexPath.row].done == false {
       //     itemArray[indexPath.row].done = true
       // } else {
       //     itemArray[indexPath.row].done = false
       // }
        
        // po zaznaczeniu linijek trzeba przeladowac widok, by nie zaznaczlo tylko w tabeli ale wyswietlil to tez widok
        //tableView.reloadData()  <- to juz jest w saveItem() funkcji
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new TodoeyItem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks Add Item button on out UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            //po dodaniu do tabeli musimy przeładować tabelę by wyswietlil sie nowy element dodany
            
            self.saveItem()
            
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
    
    //MARK - Model Manupulation Methon
    // sumujemy tu łączną funkcję sumowania danych i ich przeładowywania
    
    func saveItem() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        //self.defaults.set(self.itemArray, forKey: "TodoListArray")
        //zapisanie w piaskonicy dla aplikacji dodanej nowej tresci
        
        self.tableView.reloadData()
    }
    
    func loadItem() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("error decodable \"error")
            }
            
        }
    }

}











