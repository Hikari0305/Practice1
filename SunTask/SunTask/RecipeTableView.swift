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

class MyButton: UIButton {
    var row:Int = 0
    var prepareStr:String = ""
    var prepareStr2:String = ""
}

class RecipeTableView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var model:[recipeData] = [
        recipeData(name: "sushi", selected: false),
        recipeData(name: "soba", selected: false),
        recipeData(name: "miso soup", selected: false)]
    
    var recipeList:[[String:Any]] =  [["id": "1",
                                       "name": "takoyaki",
                                       "pepareID": 1],
                                      ["id": "2",
                                       "name": "sushi",
                                       "pepareID": 2
                                      ]]
    var prepareList:[[String:Any]] =  [["id": 1,
                                      "recipe": "takoyaki wo tsuku ru"],
                                      ["id": 2,
                                       "recipe": "takoyaki wo tsuku ru"]]
    
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
    
    // -----------------------------------
    // Table View
    // -----------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell")
        cell?.accessoryType = .none
        cell?.textLabel!.text = model[indexPath.row].name
        
        let uiButton = MyButton()
        uiButton.row = indexPath.row
        //let howToCook = recipeList[indexPath.row]
        /*let preID = howToCook["preparedID"] // Dictionary->Any
        if preID != nil {
            let intPreID = preID as! Int // Any->Int
            // prepareListの中に、PrepareID=intPreIDのデータがあるかどうか確認する
            for item in prepareList { // item:Dictionary[String:Any]
                let tmpId = item["id"] // key=id, valueを取得する
                if tmpId != nil {
                    if tmpId as! Int == intPreID {
                        // そのデータが存在したら、HowToのStringをUIButtonにSetする
                        let howToString = item["recipe"]
                        if howToString != nil {
                            uiButton.prepareStr = howToString as! String
                        }
                    }
                }
            }
        }*/
        uiButton.frame = CGRect(x:0, y:0, width: 20, height:20)
        uiButton.backgroundColor = .red
        cell?.addSubview(uiButton)
        uiButton.addTarget(self, action: #selector(btnTapped(_ :)), for: .touchUpInside)
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
    // Btn Event handler
    @objc func btnTapped(_ sender: Any) {
        let myBtn = sender as! MyButton
        print("tapped at \(myBtn.row)")
        print(myBtn.prepareStr)
        
        let number = "this is pen"
        let str = "pen"
        for i in 0..<number.count-str.count+1 {
            let start = number.index(str.startIndex, offsetBy: i)
            let end = number.index(start, offsetBy: str.count)
            let t = number[start..<end] // "456" ← こっち
            // let tt = number[start...end] // "4567"
            print(t)
            //print(tt)
            
        }
        
    }
    
    // -----------------------------------
    // Text field
    // -----------------------------------
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
        var i = self.model.count-1
        for item in self.model.reversed() {
            if (item.selected) {
                model.remove(at: i)
            }
            i-=1
        }
        self.tableView.reloadData()
    }
}
