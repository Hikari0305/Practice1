//
//  RecipeTableView.swift
//  SunTask
//
//  Created by shiho on 2021/04/02.
//

import UIKit

struct recipeData {
    var name:String
    var selected:Bool
}

class RecipeTableView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var model:[recipeData] = [
        recipeData(name: "sushi", selected: false),
        recipeData(name: "soba", selected: false),
        recipeData(name: "miso soup", selected: false)]
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.tableView.allowsMultipleSelection = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //
    // Table View
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("called cellForRowAt_tableView!:")
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell")
        cell?.accessoryType = .none
        cell?.textLabel!.text = model[indexPath.row].name
        return cell!
    }
    // Called When selecting cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        self.model[indexPath.row].selected = true
    }
    // Called When deselecting cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
        self.model[indexPath.row].selected = false
    }
    
    
    //
    // Text field
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onAddRecipe(_ sender: Any) {
        self.model.append(recipeData(name: textField.text!, selected: false))
        self.textField.text=""
        self.tableView.reloadData()
    }
    
    @IBAction func onRemoveRecipe(_ sender: Any) {
        var i = model.count-1
        for item in model.reversed() {
            if (item.selected) {
                model.remove(at: i)
            }
            i-=1
        }
        self.tableView.reloadData()
    }
}
