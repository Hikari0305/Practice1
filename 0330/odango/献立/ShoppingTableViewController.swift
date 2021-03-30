//
//  TableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

class ShoppingTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    var val = commonDictionary[key2021323]
    lazy var shopList: [[String:String]] = val![keyIngList] as! [[String:String]]
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    var ud = UserDefaults.standard
    var status = String()
    
    func updateData (_ selectedDate:String) {
        localDate = selectedDate
        self.val = commonDictionary[selectedDate]
        if val != nil {
            self.shopList = self.val![keyIngList] as! [[String:String]]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let temp = shopList[indexPath.row]
        let ingname = temp[keyIngName]
        let ingq = temp[keyIngQ]
        if ingname != nil, ingq != nil {
            let labelString = ingname! + " : " + ingq!
            cell.textLabel!.text = labelString
            cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size:15) // Change the font size as per your requirement
            cell.textLabel!.font = UIFont(name: "Avenir-Roman", size: 22)
            if (self.val![labelString] != nil) {
                cell.imageView?.image = UIImage(named: "checked-checkbox--v1.png")
            } else {
                cell.imageView?.image = UIImage(named: "unchecked-checkbox.png")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let cellText = cell.textLabel?.text
            if cell.imageView?.image == UIImage(named: "checked-checkbox--v1.png") {
                self.val?.updateValue(false, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "unchecked-checkbox.png")
            } else {
                self.val?.updateValue(true, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "checked-checkbox--v1.png")
            }
            cell.isSelected = false
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
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

