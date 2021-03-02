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
    
    
    //ホーム、今月の旬
    @IBOutlet weak var scrollview: UIScrollView! {
        didSet {
            scrollview.isPagingEnabled = true
         }
   }
    
    //新規投稿、写真のみor動画あり
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //マイページ、プロフィール、アカウント名の変更
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var accountLabel: UILabel!
    @IBAction func setText(_ sender: AnyObject) {
        accountLabel.text = accountTextField.text
    }//ここまで　マイページ、アカウント名の変更
    
    //ホーム、メッセージの通知
    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBAction func messageUISwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchStatusLabel.text = "ONです"
        } else {
            switchStatusLabel.text = "OFFです"
        }
    }//ここまで　ホーム、メッセージの通知
    
    //ホーム、メッセージ
    @IBOutlet weak var messageTable: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
                   return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //    後で直してください
            return 1
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.textView.text = "じゃがいも１個"
      
            // Configure the cell...

            return cell
        }

    
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
        
        //
        setupView()
        
    }
       
    /*https://qiita.com/nnk-ymmt/items/61cd991de50777455f57 ①の手順４　　popup*/
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //買い物かご、チェックボックス
        if let tableViewController = segue.destination as? TableViewController {
            self.tableViewController = tableViewController
            
        }
    }

        
//投稿のsegmented control（写真のみか動画あり）
    
    private lazy var sample1ViewController: PhotoViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "Sample1ViewController") as! PhotoViewController
        addChild(viewController)
        return viewController
    }()

    private lazy var sample2ViewController: VideoViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "Sample2ViewController") as! VideoViewController
        addChild(viewController)
        return viewController
    }()

    // MARK: - View Methods

    private func setupView() {
        updateView()
    }

    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(VideoViewController)
            addChild(PhotoViewController)
        } else {
            remove(PhotoViewController)
            addChild(VideoViewController)
        }
    }
   
    @IBAction func tapsegmentedControl(_ sender: UISegmentedControl) {
        
        func add(asChildViewController viewController: UIViewController) {
                // 子ViewControllerを追加
            addChild(viewController)
                // Subviewとして子ViewControllerのViewを追加
                view.addSubview(viewController.view)
                // 子Viewの設定
                viewController.view.frame = view.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                // 子View Controllerへの通知
            viewController.didMove(toParent: self)
        }
        func remove(asChildViewController viewController: UIViewController) {
                // 子View Controllerへの通知
            viewController.willMove(toParent: nil)
                // 子ViewをSuperviewから削除
                viewController.view.removeFromSuperview()
                // 子View Controllerへの通知
            viewController.removeFromParent()
            }
    }
        
}

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


