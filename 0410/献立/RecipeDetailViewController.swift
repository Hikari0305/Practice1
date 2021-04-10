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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //何もないセルの区切り線をなくす
        self.ingredientsTable.tableFooterView = UIView()
        self.howtoTable.tableFooterView = UIView()
        //recipeName.frame = CGRect(x: 15, y: 110, width: 379, height: 40)
        
        self.recipeName.text = self.recipe
        self.recipeImage.image = UIImage(named: self.imagePath )
        print(self.imagePath)
        self.timeLabel.text = self.time
        self.calorieLabel.text = self.calorie
        
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        self.howtoTable.delegate = self
        self.howtoTable.dataSource = self
        
        self.lists.append(contentsOf: self.ingList)
        //        lists.append(contentsOf: recipeList)
    }
    
    override func viewDidLayoutSubviews() {
        
        self.recipeDetailScrollView.contentSize = self.recipeDetailView.frame.size
        self.recipeDetailScrollView.flashScrollIndicators()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    //初期値にStringを受け取る
//        init(name: String) {
//            //受け取ったデータをnameLabelのテキストにする
//            recipeName.text = name
//            super.init(nibName: nil, bundle: nil)
//        }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func updateData (_ selectedDate:String) {
        localDate = selectedDate
        self.val = commonDictionary[selectedDate]
        if (val != nil) {
            print("valisnotnil")
            if (self.val![keyName] != nil) {
                self.recipe = self.val![keyName] as! String
            }
            if (self.val![keyPath] != nil) {
                self.imagePath = self.val![keyPath] as! String
            }
            if (self.val![keyTime] != nil) {
                self.time = self.val![keyTime] as! String
            }
            if (self.val![keyCalorie] != nil) {
                self.calorie = self.val![keyCalorie] as! String
            }
            if (self.val![keyIngList] != nil) {
                self.ingList = self.val![keyIngList] as! [[String:String]]
            }
            if (self.val![keyHowto] != nil) {
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
                if (self.val != nil) {
                    print("valisnotnil")
                    if (self.val![keyName] != nil) {
                        self.recipe = self.val![keyName] as! String
                    }
                    if (self.val![keyPath] != nil) {
                        self.imagePath = self.val![keyPath] as! String
                    }
                    if (self.val![keyTime] != nil) {
                        self.time = self.val![keyTime] as! String
                    }
                    if (self.val![keyCalorie] != nil) {
                        self.calorie = self.val![keyCalorie] as! String
                    }
                    if (self.val![keyIngList] != nil) {
                        self.ingList = self.val![keyIngList] as! [[String:String]]
                    }
                    if (self.val![keyHowto] != nil) {
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
            self.tag = 0
            self.cellIdentifier = "ingCell"
        }
        else {
            self.tag = 1
            self.cellIdentifier = "howtoCell"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.checkTableView(tableView)
        return self.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.checkTableView(tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath as IndexPath) as? IngTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath as IndexPath) as? HowtoTableViewCell
        var textData = ""
        if (self.tag == 0) {
            //材料取得
            let ing = self.ingList[indexPath.row]
            let ingname = ing[keyIngName]
            let ingq = ing[keyIngQ]
            if ingq != nil, ingname != nil {
                textData = ingname! + " : " + ingq!
            }
        }
        
        else if (self.tag == 1) {
            //手順取得
            let temp2 = self.recipeList[indexPath.row]
            let recipeOrder = temp2[keyOrder] as! Int
            let recipeDetail = temp2[keyDetail] as! String
            
            textData = String(recipeOrder) + ". " + recipeDetail
        }
        else {
            // do nothing
        }
        //cellの内容をupdate
        cell?.self.recipeDetailLabel!.text = textData
        cell2?.self.recipeDetailLabel2!.text = textData
        //イメージをアップデートする
        if (self.val![textData] != nil) {
            cell?.self.checkBoxImage.image = self.checked
        } else {
            cell?.self.checkBoxImage.image = self.unchecked
        }
        if cell != nil {
            return cell!
        }
        
        if (self.val![textData] != nil) {
            cell2?.checkBoxImage2.image = self.checked
        } else {
            cell2?.checkBoxImage2.image = self.unchecked
        }
        if cell2 != nil {
            //            cell2?.showPrepreButton.addTarget(self, action: #selector(self.onTapped(_ :)), for: .touchUpInside)
            cell2?.self.showPrepareButton.row = indexPath.row
            let howToCook = self.recipeList[indexPath.row]
            let ID = howToCook[keyPID]
            if ID != nil {
                let prepareID = howToCook[keyPID] as! Int
                //prepareIDがprepareTableInfoの中に存在するか確認する
                for item in prepareTableInfo {
                    let tempID = item["id"]
                    if tempID != nil {
                        //データが存在したら、nameのString,detailのStringをUIButtonにセットする
                        if tempID as! Int == prepareID {
                            let howToString = item["detail"]
                            let name = item["name"]
                            if howToString != nil {
                                cell2?.self.showPrepareButton.self.prepareStr = howToString as! String
                            }
                            if name != nil {
                                cell2?.self.showPrepareButton.self.prepareName = name as! String
                                let temp = textData
                                let temp2 = name as! String
                                for i in 0..<temp.count - temp2.count + 1 {
                                    let start = temp.index(temp2.startIndex, offsetBy: i)
                                    let end = temp.index(start, offsetBy: temp2.count)
                                    let t = temp[start..<end]
                                    print(t)
                                    print("temp2\(temp2)")
                                    if t.lowercased() == temp2.lowercased() {
                                        let attrText = NSMutableAttributedString(string: (cell2?.self.recipeDetailLabel2.text)!)
                                        print(textData.count)
                                        print(i + temp2.count)
                                        attrText.addAttributes([.foregroundColor: UIColor.red,], range:NSRange(location: i, length: temp2.count))
                                        
                                        cell2?.self.recipeDetailLabel2.attributedText = attrText
                                    }
                                }
                            }
                        }
                    }
                    
                }
            } else {
                cell2?.self.showPrepareButton.isHidden = true
                cell2?.self.showPrepareButton.isEnabled = false
            }
            cell2?.self.showPrepareButton.addTarget(self, action: #selector(self.onTapped(_:)), for: .touchUpInside)
            return cell2!
        }
        
        return HowtoTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? IngTableViewCell {
            //            let cellText = cell.textLabel?.text
            
            if cell.self.checkBoxImage.image == self.checked {
                //                self.val?.updateValue(false, forKey: cellText!)
                cell.self.checkBoxImage.image = self.unchecked
                cell.backgroundColor = .white
            } else {
                //                self.val?.updateValue(true, forKey: cellText!)
                cell.self.checkBoxImage.image = self.checked
                cell.backgroundColor = .lightGray
            }
            cell.isSelected = false
        }
        if let cell = tableView.cellForRow(at: indexPath) as? HowtoTableViewCell {
            if cell.self.checkBoxImage2.image == self.checked {
                cell.self.checkBoxImage2.image = self.unchecked
            } else {
                cell.self.checkBoxImage2.image = self.checked
            }
            cell.isSelected = false
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.howtoTable.estimatedRowHeight = 100
        self.howtoTable.rowHeight = UITableView.automaticDimension
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
    
    @objc func onTapped(_ sender: Any) {
        let tappedButton = sender as! MyButton
        print(tappedButton.self.row)
        print(tappedButton.self.prepareStr)
        print(tappedButton.self.prepareName)
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "preparingViewController") as! PreparingViewController
        self.navigationController?.pushViewController(nextView, animated: true)
        
        //        if (commonDictionary[key2021323[keyHowto["prepareID"]]] == nil)
        nextView.self.updateData(tappedButton.self.prepareName, tappedButton.self.prepareStr)
    }
}
