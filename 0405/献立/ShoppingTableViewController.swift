//
//  TableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

var val = commonDictionary[key2021323]
struct ingData {
    var name: [[String:String]]
    var selected: Bool
}

class ShoppingTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    var val = commonDictionary[key2021323]
    lazy var shopList: [ingData] = [
        ingData(name: val![keyIngList] as! [[String : String]], selected: false)
    ]
//    lazy var shopList: [[String:String]] =  val![keyIngList] as! [[String:String]]
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    var ud = UserDefaults.standard
    var status = String()
    
    func updateData (_ selectedDate:String) {
        localDate = selectedDate
        self.val = commonDictionary[selectedDate]
        if val != nil {
            self.shopList = self.val![keyIngList] as! [ingData]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let temp = shopList[indexPath.row].name
        let ingname = shopList[indexPath.row].name
        //temp[keyPath: keyIngName]
        let ingq = shopList[indexPath.row].name
//        if ingname != nil, ingq != nil {
//            let labelString = ingname! + " : " + ingq!
//            cell.textLabel!.text = labelString
//            cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size:15) // Change the font size as per your requirement
//            cell.textLabel!.font = UIFont(name: "Avenir-Roman", size: 22)
//            if (self.val![labelString] != nil) {
//                cell.imageView?.image = checked
//                cell.backgroundColor = .lightGray
//            } else {
//                cell.imageView?.image = unchecked
//                cell.backgroundColor = .white
//            }
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let cellText = cell.textLabel?.text
            
            if cell.imageView?.image == checked {
                self.val?.updateValue(false, forKey: cellText!)
                cell.imageView?.image = unchecked
                cell.backgroundColor = .white
            } else {
                self.val?.updateValue(true, forKey: cellText!)
                cell.imageView?.image = checked
                cell.backgroundColor = .lightGray
            }
            cell.isSelected = false
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    @IBAction func finishShopping(_ sender: Any) {
        var i = shopList.count-1
        for item in shopList.reversed() {
            if (item.selected) {
                shopList.remove(at: i)
            }
            i-=1
        }
        self.shoppingTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //何もないセルの区切り線をなくす
        shoppingTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

