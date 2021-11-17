//
//  RecipeDetailViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/24.
//

import UIKit
//import AVFoundation
//import MediaPlayer
import AVKit
import YoutubePlayer_in_WKWebView

class RecipeDetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,WKYTPlayerViewDelegate {
    
    @IBOutlet weak var recipeDetailScrollView: UIScrollView!
    @IBOutlet weak var recipeDetailView: UIView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet weak var menuStatusImage: UIImageView!
    @IBOutlet weak var shoppingStatusButton: UIButton!
    @IBOutlet weak var prepareStatusButton: UIButton!
    @IBOutlet weak var cookStatusButton: UIButton!
    
    @IBOutlet weak var yTPlayer: WKYTPlayerView!
    
    var statusStack = UIStackView()
    
    var ingList2 = ["1", "2"]
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var howtoTable: UITableView!
    
    var val = [String:Any]()
    lazy var recipe = ""
    lazy var imagePath = ""
    lazy var time = ""
    lazy var calorie = ""
    lazy var ingList = [[String:String]]()
    lazy var recipeList = [[String:Any]]()
//    lazy var lists: [[String:String]] = []
    var recipeId: String = ""
    var localDate = "hoge"
    
    var checked :UIImage = UIImage(named: "checked-checkbox--v1.png")!
    var unchecked :UIImage = UIImage(named: "unchecked-checkbox.png")!
    var ud = UserDefaults.standard
    var status = String()
    enum IconType {
        case shoppingIcon
        case preparingIcon
        case cookingIcon
    }
    
    var player: AVPlayer?
    
    
    @IBAction func playVideo(_ sender: AnyObject) {
        print("playvideoが呼ばれた")
        guard let url = URL(string: "https://www.youtube.com/watch?v=zYtwNkJmbOQ") else { return }
        //https://www.youtube.com/watch?v=zYtwNkJmbOQ
        //https://example.com/my-example-video.m3u8
        //https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4
        
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        //        player = AVPlayer(url: url)
        
        // Create a new AVPlayerViewController and pass it a reference to the player.
        /*
        let controller = AVPlayerViewController()
        controller.player = AVPlayer(url: url)
        present(controller, animated: true) {
            controller.player?.play()
        }
        */
        
        yTPlayer.load(withVideoId: "v=zYtwNkJmbOQ")
        //controller.player = player
        
        
        // Modally present the player and call the player's play() method when complete.
        //        self.present(controller, animated: true) {[self] in
        //            print("present")
        //            player!.play()
        //        }
    }
    
    //var playButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playButton.setTitle("", for: UIControl.State.normal)
//        playButton.tag = 0
//        playButton.addTarget(self, action: #selector(self.tappedVideo(_ :)), for: .touchUpInside)
        
        //何もないセルの区切り線をなくす
        self.ingredientsTable.tableFooterView = UIView()
        self.howtoTable.tableFooterView = UIView()
        
        self.recipeName.text = self.recipe
        
        print(self.imagePath)
        self.timeLabel.text = self.time
        self.calorieLabel.text = self.calorie
        
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        self.howtoTable.delegate = self
        self.howtoTable.dataSource = self
        
        self.playButton.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        self.playButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        self.yTPlayer.delegate = self
        
        setUpButtons()
    }
    
//    @objc func tappedVideo(_ sender: UIButton){
//        playVideo()
//        print("ボタンがタップされた")
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        if let imageView = self.playButton.subviews.compactMap({$0 as? UIImageView}).first {
//            imageView.contentMode = .scaleAspectFit //<-
//        }
//    }
    
    func setUpButtons() {
        self.menuStatusImage.image = UIImage(named: "MenuYellow.png")
        self.menuStatusImage.frame = CGRect(x: 16, y: 100, width: 75, height: 75)

        self.shoppingStatusButton.frame = CGRect(x: 119, y: 100, width: 75, height: 75)
        self.prepareStatusButton.frame = CGRect(x: 222, y: 100, width: 75, height: 75)
        self.cookStatusButton.frame = CGRect(x: 325, y: 100, width: 75, height: 75)
        
        view.addSubview(menuStatusImage)
        view.addSubview(shoppingStatusButton)
        view.addSubview(prepareStatusButton)
        view.addSubview(cookStatusButton)
        recipeDetailView.addSubview(playButton)
   
        self.shoppingStatusButton.setBackgroundImage(UIImage(named: "スライド2.JPG"), for: .normal)
        self.aspectFill(shoppingStatusButton)
        self.prepareStatusButton.setBackgroundImage(UIImage(named: "スライド3.JPG"), for: .normal)
        aspectFill(prepareStatusButton)
        self.cookStatusButton.setBackgroundImage(UIImage(named: "スライド4.JPG"), for: .normal)
        aspectFill(cookStatusButton)
        
        self.playButton.setBackgroundImage(UIImage(named: self.imagePath), for: .normal)
        aspectFill(playButton)
    }
    
    func aspectFill(_ btn: UIButton) {
        btn.setTitle("", for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        
        btn.clipsToBounds = true
    }
    
//    override func viewDidLayoutSubviews() {
//
//        self.recipeDetailScrollView.contentSize = self.recipeDetailView.frame.size
//        self.recipeDetailScrollView.flashScrollIndicators()
//
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateDataWithID (_ selectedID:String) {
        for(key,value) in commonRecipeList {
            print("dictionary key is \(key), value is\(value)")
            //            let tempID = value[keyID] as! String
            if key == selectedID {
                self.val = value
                if (self.val[keyName] != nil) {
                    self.recipe = self.val[keyName] as! String
                }
                if (self.val[keyPath] != nil) {
                    self.imagePath = self.val[keyPath] as! String
                }
                if (self.val[keyTime] != nil) {
                    self.time = self.val[keyTime] as! String
                }
                if (self.val[keyCalorie] != nil) {
                    self.calorie = self.val[keyCalorie] as! String
                }
                if (self.val[keyIngList] != nil) {
                    self.ingList = self.val[keyIngList] as! [[String:String]]
                }
                if (self.val[keyHowto] != nil) {
                    self.recipeList = self.val[keyHowto] as! [[String:Any]]
                }
            }
        }
        recipeId = selectedID
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
        print("tableview tag: ", tableView.tag)
        print("self.tag: ", self.tag)
        if (tableView.tag == 0) {
            print("inglist count: ", ingList.count)
            return ingList.count
        } else if (tableView.tag == 1){
            print("recipelist count: ", recipeList.count)
            return recipeList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.checkTableView(tableView)
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath as IndexPath) as? IngTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath as IndexPath) as? HowtoTableViewCell
        //表示したいテキスト
        var textData = ""
        if (tableView.tag == 0) {
            if ingList.count > indexPath.row {
                //材料取得
                let ing = self.ingList[indexPath.row]
                let ingname = ing[keyIngName]
                let ingq = ing[keyIngQ]
                if ingq != nil, ingname != nil {
                    textData = ingname! + " : " + ingq!
                }
                if recipeStatusList[recipeId] == nil {
                    return cell!
                }
                if (recipeStatusList[recipeId]?.shoppingList.count)! > indexPath.row {
                    let current = recipeStatusList[recipeId]?.shoppingList[indexPath.row]
                    if current == true {
                        cell?.self.checkBoxImage.image = self.checked
                    } else {
                        cell?.self.checkBoxImage.image = self.unchecked
                    }
                }
            }
        } else if (tableView.tag == 1) {
            //手順取得
            if recipeList.count > indexPath.row {
                let temp2 = self.recipeList[indexPath.row]
                let recipeOrder = temp2[keyOrder] as! Int
                let recipeDetail = temp2[keyDetail] as! String
                
                textData = String(recipeOrder) + ". " + recipeDetail

                if recipeStatusList[recipeId] == nil {
                    return cell2!
                }
                if (recipeStatusList[recipeId]?.preparingList.count)! > indexPath.row {
                    let current = recipeStatusList[recipeId]?.preparingList[indexPath.row]
                    if current == true {
                        cell2?.self.checkBoxImage2.image = self.checked
                    } else {
                        cell2?.self.checkBoxImage2.image = self.unchecked
                    }
                } else if (recipeStatusList[recipeId]?.cookingList.count)! > indexPath.row-(recipeStatusList[recipeId]?.preparingList.count)! {
                    let current = recipeStatusList[recipeId]?.cookingList[indexPath.row-(recipeStatusList[recipeId]?.preparingList.count)!]
                    if current == true {
                        cell2?.self.checkBoxImage2.image = self.checked
                    } else {
                        cell2?.self.checkBoxImage2.image = self.unchecked
                    }
                } else {
                    print("初期化されませんでした")
                    print(indexPath.row)
                }
            }
        } else {
            // do nothing
        }
        //cellの内容をupdate
        cell?.self.recipeDetailLabel!.text = textData
        cell2?.self.recipeDetailLabel2!.text = textData
        //イメージをアップデートする
        
        if cell != nil {
            return cell!
        }
        
//        if (self.val[textData] != nil) {
//            cell2?.checkBoxImage2.image = self.checked
//        } else {
//            cell2?.checkBoxImage2.image = self.unchecked
//        }
        if cell2 != nil {
            if recipeList.count <= indexPath.row {
                return cell2!
            }
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
        //材料用のtableです
        if let cell = tableView.cellForRow(at: indexPath) as? IngTableViewCell {
            if cell.self.checkBoxImage.image == self.checked {
                cell.self.checkBoxImage.image = self.unchecked
            } else {
                cell.self.checkBoxImage.image = self.checked
            }

            cell.isSelected = false
            
            //レシピステータスを更新する
            if (recipeStatusList[recipeId]?.shoppingList.count)! > indexPath.row {
                let current = recipeStatusList[recipeId]?.shoppingList[indexPath.row]
                recipeStatusList[recipeId]?.shoppingList[indexPath.row] = !(current!)
                print("current: ", current!)
            }
        }
        //これは作り方用のtableです
        if let cell = tableView.cellForRow(at: indexPath) as? HowtoTableViewCell {
            if cell.self.checkBoxImage2.image == self.checked {
                cell.self.checkBoxImage2.image = self.unchecked
            } else {
                cell.self.checkBoxImage2.image = self.checked
            }
            cell.isSelected = false
            
            //レシピステータスを更新します
            if (recipeStatusList[recipeId]?.preparingList.count)! > indexPath.row {
                let current = recipeStatusList[recipeId]?.preparingList[indexPath.row]
                recipeStatusList[recipeId]?.preparingList[indexPath.row] = !(current!)
                print("preparing current: ", current!)
                print("indexpath: ", indexPath.row)
            } else if (recipeStatusList[recipeId]?.cookingList.count)! > indexPath.row-(recipeStatusList[recipeId]?.preparingList.count)! {
                let current = recipeStatusList[recipeId]?.cookingList[indexPath.row-(recipeStatusList[recipeId]?.preparingList.count)!]
                //                if (recipeStatusList[recipeId]?.cookingList.count)! > indexPath.row {
                print("cooking current: ", current!)
                print("indexpath: ", indexPath.row)
                let targetIndex = indexPath.row-(recipeStatusList[recipeId]!.preparingList.count)
                recipeStatusList[recipeId]?.cookingList[targetIndex] = !(current!)
                    
//                }
            }

        }
        //現在のstatusの状態を確認します
        var flag = true
        for item in recipeStatusList[recipeId]!.shoppingList {
            if item == false {
                flag = false
                break
            }
        }
        updateIconStatus(flag, .shoppingIcon)
        flag = true
        for item in recipeStatusList[recipeId]!.preparingList {
            if item == false {
                flag = false
                break
            }
        }
        updateIconStatus(flag, .preparingIcon)
        flag = true
        for item in recipeStatusList[recipeId]!.cookingList {
            if item == false {
                flag = false
                break
            }
        }
        updateIconStatus(flag, .cookingIcon)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.howtoTable.estimatedRowHeight = 100
        self.howtoTable.rowHeight = UITableView.automaticDimension
        return UITableView.automaticDimension
    }
    func updateIconStatus(_ done: Bool,_ targetIcon: IconType) {
        switch targetIcon {
        case .shoppingIcon:
            if done == true {
                shoppingStatusButton.setBackgroundImage(UIImage(named: "ShoppingYellow.png"), for: .normal)
            } else {
                shoppingStatusButton.setBackgroundImage(UIImage(named: "スライド2.JPG"), for: .normal)
            }
            break
        case .preparingIcon:
            if done == true {
                prepareStatusButton.setBackgroundImage(UIImage(named: "PrepareYellow.png"), for: .normal)
            } else {
                prepareStatusButton.setBackgroundImage(UIImage(named: "スライド3.JPG"), for: .normal)
            }
            break
        case .cookingIcon:
            if done == true {
                cookStatusButton.setBackgroundImage(UIImage(named: "CookYellow.png"), for: .normal)
            } else {
                cookStatusButton.setBackgroundImage(UIImage(named: "スライド4.JPG"), for: .normal)
            }
            break
        default:
            break
        }
    }
    
    @objc func onTapped(_ sender: Any) {
        let tappedButton = sender as! MyButton
        print(tappedButton.self.row)
        print(tappedButton.self.prepareStr)
        print(tappedButton.self.prepareName)
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "preparingViewController") as! PreparingViewController
        self.navigationController?.pushViewController(nextView, animated: true)
        
        nextView.self.updateData(tappedButton.self.prepareName, tappedButton.self.prepareStr, tappedButton.self.prepareImage)
    }
}
