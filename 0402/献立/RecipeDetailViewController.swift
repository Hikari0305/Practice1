//
//  RecipeDetailViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/24.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var recipeDetailScrollView: UIScrollView!
    @IBOutlet weak var recipeDetailView: UIView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    var ingList2 = ["1", "2"]
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var howtoTable: UITableView!
    
    var val = commonDictionary[key2021323]
    lazy var recipe = val![keyName] as! String
    lazy var imagePath = val![keyPath] as! String
    lazy var time = val![keyTime] as! String
    lazy var calorie = val![keyCalorie] as! String
    lazy var ingList: [[String:String]] = val![keyIngList] as! [[String:String]]
    lazy var recipeList: [[String:Any]] = val![keyHowto] as! [[String:Any]]
    lazy var lists: [[String:String]] = []
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    var ud = UserDefaults.standard
    var status = String()
    
    func updateData (_ selectedDate:String) {
        localDate = selectedDate
        self.val = commonDictionary[selectedDate]
        if (val != nil) {
            print("valisnotnil")
            if (val![keyName] != nil) {
                self.recipe = self.val![keyName] as! String
            }
            if (val![keyPath] != nil) {
                self.imagePath = self.val![keyPath] as! String
            }
            if (val![keyTime] != nil) {
                self.time = self.val![keyTime] as! String
            }
            if (val![keyCalorie] != nil) {
                self.calorie = self.val![keyCalorie] as! String
            }
            if (val![keyIngList] != nil) {
                self.ingList = self.val![keyIngList] as! [[String:String]]
            }
            if (val![keyHowto] != nil) {
                var temp = self.val![keyHowto] as! [[String:Any]]
                print(temp)
            }
            
        }
        
        print("calledupdateData")
    }
    func updateDataWithID (_ selectedID:String) {
        for(key,value) in commonDictionary {
            print("dictionary key is \(key), value is\(value)")
            let tempID = value[keyID] as! String
            if tempID == selectedID {
                self.val = value
                if (val != nil) {
                    print("valisnotnil")
                    if (val![keyName] != nil) {
                        self.recipe = self.val![keyName] as! String
                    }
                    if (val![keyPath] != nil) {
                        self.imagePath = self.val![keyPath] as! String
                    }
                    if (val![keyTime] != nil) {
                        self.time = self.val![keyTime] as! String
                    }
                    if (val![keyCalorie] != nil) {
                        self.calorie = self.val![keyCalorie] as! String
                    }
                    if (val![keyIngList] != nil) {
                        self.ingList = self.val![keyIngList] as! [[String:String]]
                    }
                    if (val![keyHowto] != nil) {
                        var temp = self.val![keyHowto] as! [[String:Any]]
                        print(temp)
                    }
                    
                }
            }
        }
    }
    // 処理分岐用
        var tag:Int = 0
        var cellIdentifier:String = ""
    // 処理を分岐するメソッド
        func checkTableView(_ tableView: UITableView) -> Void{
            if (tableView.tag == 0) {
                tag = 0
                cellIdentifier = "ingCell"
            }
            else {
                tag = 1
                cellIdentifier = "howtoCell"
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkTableView(tableView)
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        checkTableView(tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as? IngTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as? HowtoTableViewCell
        var textData = ""
        if (tag == 0) {
            //材料取得
            let temp = ingList[indexPath.row]
            let ingname = temp[keyIngName]
            let ingq = temp[keyIngQ]
            if ingq != nil, ingname != nil {
                textData = ingname! + ":" + ingq!
            }
        }
       
        else if (tag == 1) {
            //手順取得
            let temp2 = recipeList[indexPath.row]
            let recipeOrder = temp2[keyOrder] as! Int
            let recipeDetail = temp2[keyDetail] as! String

            textData = String(recipeOrder) + ". " + recipeDetail
        }
        else {
            // do nothing
        }
        //cellの内容をupdate
        cell?.recipeDetailLabel!.text = textData
        cell2?.recipeDetailLabel2!.text = textData
//        //折り返しアリに設定
//        cell?.recipeDetailLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
//        //cell内で改行
//        cell?.recipeDetailLabel?.numberOfLines=0
        //イメージをアップデートする
        if (self.val![textData] != nil) {
            cell?.checkBoxImage.image = checked
//            cell.backgroundColor = .lightGray
        } else {
            cell?.checkBoxImage.image = unchecked
//            cell.backgroundColor = .white
        }
        if cell != nil {
            return cell!
        }
        
        if (self.val![textData] != nil) {
            cell2?.checkBoxImage2.image = checked
        } else {
            cell2?.checkBoxImage2.image = unchecked
        }
        if cell2 != nil {
            return cell2!
        }
        
        return HowtoTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? IngTableViewCell {
//            let cellText = cell.textLabel?.text
            
            if cell.checkBoxImage.image == checked {
//                self.val?.updateValue(false, forKey: cellText!)
                cell.checkBoxImage.image = unchecked
                cell.backgroundColor = .white
            } else {
//                self.val?.updateValue(true, forKey: cellText!)
                cell.checkBoxImage.image = checked
                cell.backgroundColor = .lightGray
            }
            cell.isSelected = false
        }
        if let cell = tableView.cellForRow(at: indexPath) as? HowtoTableViewCell {
            if cell.checkBoxImage2.image == checked {
                cell.checkBoxImage2.image = unchecked
            } else {
                cell.checkBoxImage2.image = checked
            }
            cell.isSelected = false
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.howtoTable.estimatedRowHeight = 100
        howtoTable.rowHeight = UITableView.automaticDimension
        return UITableView.automaticDimension
    }
    
//    func configureSV() {
//        // scrollViewにcontentsViewを配置させる
//        let subView = createContentsView()
//        recipeDetailScrollView.addSubview(recipeDetailView)
//        // scrollViewにcontentsViewのサイズを教える
//        //recipeDetailScrollView.contentSize = subView.frame.size
//    }
//
//    func createContentsView() {
//        recipeDetailScrollView.addSubview(recipeDetailView)
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()

        //何もないセルの区切り線をなくす
        ingredientsTable.tableFooterView = UIView()
        howtoTable.tableFooterView = UIView()
        //recipeName.frame = CGRect(x: 15, y: 110, width: 379, height: 40)
        
        recipeName.text = recipe as? String
        recipeImage.image = UIImage(named: imagePath )
        timeLabel.text = time as? String
        calorieLabel.text = calorie as? String
        
        ingredientsTable.delegate = self
        ingredientsTable.dataSource = self
        howtoTable.delegate = self
        howtoTable.dataSource = self
        
        lists.append(contentsOf: ingList)
//        lists.append(contentsOf: recipeList)
    }
    
    override func viewDidLayoutSubviews() {

        recipeDetailScrollView.contentSize = recipeDetailView.frame.size
        recipeDetailScrollView.flashScrollIndicators()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
