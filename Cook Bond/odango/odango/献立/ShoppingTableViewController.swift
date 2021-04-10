//
//  TableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

//var val = commonDictionary[key2021323]
//struct ingData {
//    var name: [[String:String]]
//    var selected: Bool
//}

class ShoppingTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    var val = commonDictionary[key2021323]
//    lazy var shopList: [ingData] = [
//        ingData(name: self.val![keyIngList] as! [[String : String]], selected: false)
//    ]
    lazy var shopList: [[String:String]] =  val![keyIngList] as! [[String:String]]
    lazy var selectedList = [Bool](repeating: false, count: self.shopList.count)
    
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    var ud = UserDefaults.standard
    var status = String()
    
    func updateData (_ selectedDate:String) {
        self.localDate = selectedDate
        self.val = commonDictionary[selectedDate]
        if self.val != nil {
//            self.shopList = self.val![keyIngList] as! [ingData]
            self.shopList = self.val![keyIngList] as! [[String:String]]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let temp = self.shopList[indexPath.row]
//            .name
//        let ingname = self.shopList[indexPath.row].name
        let ingname = temp[keyIngName]
//            temp[keyPath: keyIngName]
//        let ingq = self.shopList[indexPath.row].name
        let ingq = temp[keyIngQ]
                if ingname != nil, ingq != nil {
                    let labelString = ingname! + " : " + ingq!
                    cell.textLabel!.text = labelString
                    cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size:15) // Change the font size as per your requirement
                    cell.textLabel!.font = UIFont(name: "Avenir-Roman", size: 21)
                    if (self.val![labelString] != nil) {
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
                self.val?.updateValue(false, forKey: cellText!)
                cell.imageView?.image = self.unchecked
                cell.backgroundColor = .white
            } else {
                self.val?.updateValue(true, forKey: cellText!)
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
        //何もないセルの区切り線をなくす
        self.shoppingTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

