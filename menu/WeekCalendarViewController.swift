//
//  WeekCalendarViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/18.
//

import UIKit
import FSCalendar

class WeekCalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var CalendarView: FSCalendar!
    var shopList: [[String:String]] =  [[String:String]]()
    
    struct SelectInfo {
        var selected = false
        var id = ""
        var index = 0
    }
    var selectedList = [SelectInfo]()
    
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    
    let shoppingTable: UITableView = {
        let table = UITableView(frame: CGRect(x: 10, y: 340, width: 384, height: 368))
        table.register(IngTableViewCell.self, forCellReuseIdentifier: "ShoppingTableViewCell")
        return table
    }()
    
    private var removeButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 20, y: 744, width: 374, height: 52))
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.4561446905, blue: 0.4991739988, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self , action: #selector(remove), for: .touchUpInside)
        btn.setTitle("Register Status", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        btn.layer.cornerRadius = 15.0
        return btn
    }()
    
    @objc func remove() {
        for item in self.selectedList {
            let id = item.id
            let index = item.index
            let selected = item.selected
            recipeStatusList[id]?.shoppingList[index] = selected
        }
        self.shoppingTable.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //Specify the display format with formatter
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd(EEE)"
        //date->string
        let selectedDate = formatter.string(from: date)
        print(selectedDate)

        updateData(selectedDate)
        shoppingTable.reloadData()
    }

    func updateData (_ selectedDate:String) {
        shopList.removeAll()
        self.localDate = selectedDate
        let value = commonDictionary[selectedDate]
        if value != nil {
            let ids = value![keyID]!
            for id in ids {
                let recipeData = commonRecipeList[id]
                if recipeData != nil {
                    let ingList = recipeData!["ingredients"] as! [[String : String]]
                    self.shopList.append(contentsOf: ingList)
                    var i = 0
                    let ingStatusList = recipeStatusList[id]?.shoppingList
                    if ingStatusList != nil {
                        for item in ingList {
                            let info = SelectInfo(selected: ingStatusList![i], id: id, index: i)
                            
                            selectedList.append(info)
                            i += 1
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath)
        let temp = self.shopList[indexPath.row]
        let ingname = temp[keyIngName]
        let ingq = temp[keyIngQ]
                if ingname != nil, ingq != nil {
                    let labelString = ingname! + " : " + ingq!
                    cell.textLabel!.text = labelString
                    cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size:15)
                    cell.textLabel!.font = UIFont(name: "Avenir-Roman", size: 21)
                    if (self.selectedList[indexPath.row].selected) {
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
            
            if cell.imageView?.image == self.checked {
                cell.imageView?.image = self.unchecked
                cell.backgroundColor = .white
            } else {
                cell.imageView?.image = self.checked
                cell.backgroundColor = .lightGray
            }
            cell.isSelected = false
        }
        self.selectedList[indexPath.row].selected = !self.selectedList[indexPath.row].selected
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CalendarView.scope = .week
        self.shoppingTable.backgroundColor = #colorLiteral(red: 1, green: 0.7984619737, blue: 0, alpha: 1)
        view.addSubview(shoppingTable)
        view.addSubview(removeButton)
        
        self.CalendarView.dataSource = self
        self.CalendarView.delegate = self
        
        self.shoppingTable.delegate = self
        self.shoppingTable.dataSource = self
    }

}
