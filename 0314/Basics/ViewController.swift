//
//  ViewController.swift
//  odango
//
//  Created by 吉田光 on 2021/02/20.
//

import UIKit


class ViewController: UIViewController {
    
    //今月の旬　横スクロール
    
    let pageCount = 5
    
    let contentView = UIStackView()
    
    //献立、買い物かご、チェックボックス
    var tableViewController:TableViewController!
    
    
    //ホーム、今月の
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
    
   


    //ホーム、メッセージの設定（？？？目的が謎w）
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
