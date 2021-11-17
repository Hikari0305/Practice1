//
//  TableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

class ShoppingTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    var idList = [String:[String]]()

    var shopList: [[String:String]] =  [[String:String]]()
    var selectedList = [Bool]()
    
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    
    func updateData (_ selectedDate:String) {
        self.localDate = selectedDate
        let value = commonDictionary[selectedDate]
        if value != nil {
            
            let ids = value![keyID] as! [String]
            for id in ids {
                let recipeData = commonRecipeList[id]
                if recipeData != nil {
                    self.shopList = recipeData!["ingredients"] as! [[String : String]]
                    print(shopList)
                }
            }
            self.selectedList = [Bool](repeating: false, count: shopList.count)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let temp = self.shopList[indexPath.row]

        let ingname = temp[keyIngName]

        let ingq = temp[keyIngQ]
                if ingname != nil, ingq != nil {
                    let labelString = ingname! + " : " + ingq!
                    cell.textLabel!.text = labelString
                    cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size:15)
                    cell.textLabel!.font = UIFont.systemFont(ofSize: 20.0)
                    if (self.selectedList[indexPath.row]) {
                        cell.imageView?.image = checked
                        cell.backgroundColor = .lightGray
                    } else {
                        cell.imageView?.image = unchecked
                        cell.backgroundColor = .white
                    }
                }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let cellText = cell.textLabel?.text
            
            if cell.imageView?.image == self.checked {
                cell.imageView?.image = self.unchecked
                cell.backgroundColor = .white
            } else {
                cell.imageView?.image = self.checked
                cell.backgroundColor = .lightGray
            }
            cell.isSelected = false
        }
        self.selectedList[indexPath.row] = !self.selectedList[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    @IBAction func finishShopping(_ sender: Any) {
        var i = self.selectedList.count-1
        for item in self.selectedList.reversed() {
            if (item) {
                self.shopList.remove(at: i)
                self.selectedList.remove(at: i)
            }
            i-=1
        }
        self.shoppingTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.shoppingTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

