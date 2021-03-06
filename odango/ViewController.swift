//
//  ViewController.swift
//  odango
//
//  Created by 吉田光 on 2021/02/20.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var messageSettingTable: UITableView!
    
    //今月の旬　横スクロール
    
    let pageCount = 5
    
    let contentView = UIStackView()
    
    //献立、買い物かご、チェックボックス
    var tableViewController:TableViewController!
    
    
    //ホーム、今月の旬
    @IBOutlet weak var scrollview: UIScrollView! {
        didSet {
            scrollview.isPagingEnabled = true
         }
   }
    
    //新規投稿、写真のみor動画あり
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //マイページ、プロフィール、アカウント名の変更（完了）
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var accountLabel: UILabel!
    @IBAction func setText(_ sender: AnyObject) {
        accountLabel.text = accountTextField.text
    }//ここまで　マイページ、アカウント名の変更
    
//メッセージの設定、友達を追加と編集（削除）1回目　メモ帳に移動
    //ホーム、メッセージの通知
    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBAction func messageUISwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchStatusLabel.text = "ONです"
        } else {
            switchStatusLabel.text = "OFFです"
        }
    }//ここまで　ホーム、メッセージの通知
    
    
    //買い物かご、チェックボックス

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        contentView.spacing = 0.0
        contentView.axis = .horizontal
        contentView.alignment = .fill
        contentView.distribution = .fillEqually
        
        scrollview.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo:  scrollview.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            
            contentView.heightAnchor.constraint(equalTo: scrollview.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollview.widthAnchor,  multiplier: 0,constant: 500)
        ])
        

        //ホームの今月の旬　横スクロール１枚目
        let firstView = UIButton()
        firstView.backgroundColor = .red
        self.view.addSubview(firstView)
        contentView.addArrangedSubview(firstView)
        
        let secondView = UIButton()
        secondView.backgroundColor = .blue
        contentView.addArrangedSubview(secondView)
        
        let thirdView = UIButton()
        thirdView.backgroundColor = .green
        contentView.addArrangedSubview(thirdView)
        
        let forthview = UIButton()
        forthview.backgroundColor = .cyan
        contentView .addArrangedSubview(forthview)
        
        
        //ホーム、メッセージの設定、友達の追加と編集（削除）
        
        messageSettingTable.dataSource = self
        messageSettingTable.delegate = self
        
        messageSettingTable.allowsMultipleSelectionDuringEditing = true
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    //まだホーム、メッセージの設定、友達の追加と編集の続き
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        messageSettingTable.isEditing = editing
        
        print(editing)
    }
       
    /*https://qiita.com/nnk-ymmt/items/61cd991de50777455f57 ①の手順４　　popup*/
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //買い物かご、チェックボックス
        if let tableViewController = segue.destination as? TableViewController {
            self.tableViewController = tableViewController
            
        }
    }
}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    }
    
    
}


extension ViewController: UITableViewDelegate {
        
}
    


class messageSetting: UIViewController {
    var tableData:[String] = [
    "1.Apple",
    "2.Swift",
    "3.iPad",
    ]
   
    //ホーム、メッセージの設定、友達の削除
    @IBOutlet weak var messageSettingTable: UITableView!
    override func  viewDidLoad() {
        super.viewDidLoad()
        messageSettingTable.delegate = self
        messageSettingTable.allowsMultipleSelectionDuringEditing = true
        navigationItem.rightBarButtonItem = editButtonItem
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        messageSettingTable.isEditing = editing
        
        print(editing)
    }
    }

   
extension messageSetting: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tableData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
}//ここまでホーム、メッセージの設定、友達の削除

    //ホーム、メッセージの設定
class SubViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memberCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier:  "memberCell", for: indexPath)
        memberCell.textLabel!.text = member[indexPath.row]
        return memberCell
}

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "memberList") != nil {
            member = UserDefaults.standard.object(forKey: "memberList")
            as! [String]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



