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
    
    
    @IBOutlet weak var scrollview: UIScrollView! {
        didSet {
            scrollview.isPagingEnabled = true
        
         }
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
        
        func textLabel(label: UILabel) {
            
        func textFieldDidChange(textField: UITextField) {
            //textLabel = textField.text
            textField.addTarget(self, action: "textFieldDidChange:",for: UIControl.Event.editingChanged)
        }
        
    }
    }
        
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }

        
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    
    //投稿のsegmented control（写真のみか動画あり）
    
    var photoVC :PhotoViewController = PhotoViewController()
    var videoVC :VideoViewController = VideoViewController()
    

   
    @IBAction func segmentButoon(_ sender: UISegmentedControl) {
        
    switch sender.selectedSegmentIndex{
        case 0:
            self.view.bringSubviewToFront(photoVC.view)
        case 1:
            self.view.bringSubviewToFront(videoVC.view)
        default:
            print("")
        }
        func viewDidLoad() {
            super.viewDidLoad()
        }
        
    }
        @IBAction func changeButton(_ sender: Any) {
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                label.text = textField.text
                
            textField.resignFirstResponder()
                return true
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

//献立、カレンダーの土日の色
    extension UIColor {
        class func lightBlue() -> UIColor {
            return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
        }

        class func lightRed() -> UIColor {
            return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
        }
    }

extension UIView {
    
    enum BorderPosition {
        case Top
        case Right
        case Bottom
        case Left
    }
    
    func border(borderWidth: CGFloat, borderColor: UIColor?, borderRadius: CGFloat?) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        if let _ = borderRadius {
            self.layer.cornerRadius = borderRadius!
        }
        self.layer.masksToBounds = true
    }
    
    func border(positions: [BorderPosition], borderWidth: CGFloat, borderColor: UIColor?) {
        
        let topLine = CALayer()
        let leftLine = CALayer()
        let bottomLine = CALayer()
        let rightLine = CALayer()
        
        self.layer.sublayers = nil
        self.layer.masksToBounds = true
        
        if let _ = borderColor {
            topLine.backgroundColor = borderColor!.cgColor
            leftLine.backgroundColor = borderColor!.cgColor
            bottomLine.backgroundColor = borderColor!.cgColor
            rightLine.backgroundColor = borderColor!.cgColor
        } else {
            topLine.backgroundColor = UIColor.white.cgColor
            leftLine.backgroundColor = UIColor.white.cgColor
            bottomLine.backgroundColor = UIColor.white.cgColor
            rightLine.backgroundColor = UIColor.white.cgColor
        }
        
        if positions.contains(.Top) {
            topLine.frame = CGRect(x:0.0, y:0.0, width:self.frame.width, height:borderWidth)
            self.layer.addSublayer(topLine)
        }
        if positions.contains(.Left) {
            leftLine.frame = CGRect(x:0.0,y: 0.0, width:borderWidth,height: self.frame.height)
            self.layer.addSublayer(leftLine)
        }
        if positions.contains(.Bottom) {
            bottomLine.frame = CGRect(x:0.0,y: self.frame.height - borderWidth, width:self.frame.width, height:borderWidth)
            self.layer.addSublayer(bottomLine)
        }
        if positions.contains(.Right) {
            rightLine.frame = CGRect(x:self.frame.width - borderWidth, y:0.0,width: borderWidth, height:self.frame.height)
            self.layer.addSublayer(rightLine)
        }
        
    }
    
    @IBInspectable
        var borderWidth: CGFloat {
            get {
                return self.layer.borderWidth
            }
            set {
                self.layer.borderWidth = newValue
            }
        }
        
        @IBInspectable
        var borderColor: UIColor? {
            get {
                if let _ = self.layer.borderColor {
                    return UIColor(cgColor: self.layer.borderColor!)
                }
                return nil
            }
            set {
                self.layer.borderColor = newValue?.cgColor
            }
        }
        
        @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return self.layer.cornerRadius
            }
            set {
                self.layer.cornerRadius = newValue
            }
        }
    
}


class calenderViewController: UICollectionView{

    //セルの余白
    let cellMargin:CGFloat = 2.0
    let dateManager = DateManager()
    //１週間に何日あるか(行数)
    let daysPerWeek:Int = 7
    var startDate:Date!
    
    var calendarDelegate:CalendarViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: layout)
        self.register(CalendarCell.self, forCellWithReuseIdentifier: "collectCell")
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .white
    }
        
    func scrollViewDidScroll(_ scrollview: UIScrollView) {
        let visivleCell = self.visibleCells.filter{
            return self.bounds.contains($0.frame)
        }
        let barHeight = UIApplication.shared.statusBarFrame.size.height
                let width = self.view.frame.width
                let height = self.view.frame.height
                let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        
        //コレクションビューを設置していくよ
        myCollectView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectView.frame = CGRect(x:0,y:barHeight + 50,width:width,height:height - barHeight)
        myCollectView.register(CalendarCell.self, forCellWithReuseIdentifier: "collectCell")
        myCollectView.delegate = self
        myCollectView.dataSource = self
        myCollectView.backgroundColor = .white
               
        self.view.addSubview(myCollectView)
        
        let date = Date()
        var components = NSCalendar.current.dateComponents([.year ,.month, .day], from:date)
        components.day = 1
        components.month = 4
        components.year = 2021
        startDate = NSCalendar.current.date(from: components)
                
        let month:Int = Int(dateManager.monthTag(row:6,startDate:startDate))!
        let digit = numberOfDigit(month: month)
        var monthLabel:UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let width = self.view.frame.width
            let height = self.view.frame.height
            
                monthLabel = UILabel()
                monthLabel.frame = CGRect(x:0,y:0,width:width,height:100)
                monthLabel.center = CGPoint(x:width / 2,y:50)
                monthLabel.textAlignment = .center
            self.view.addSubview(monthLabel)
            
            
                if(digit == 5){
                    monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
                }else if(digit == 6){
                    monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
                }
                self.view.addSubview(monthLabel)
            }
            
            override func viewDidAppear(_ animated: Bool){
                myCollectView.setContentOffset(CGPoint(x:0,y:self.myCollectView.contentSize.height - self.myCollectView.frame.size.height), animated: false)
            }
        //レイアウト調整 行間余白
        func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,minimumLineSpacingForSectionAt section:Int) -> CGFloat{
            return cellMargin
            
        }
        
        //レイアウト調整　列間余白
        func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,minimumInteritemSpacingForSectionAt section:Int) -> CGFloat{
            return cellMargin
        }

        //セクションの数
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
            
        }
        
        //セルのサイズを設定
        func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize{
            let numberOfMargin:CGFloat = 8.0
            let width:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
            let height:CGFloat = width * 2.0
            return CGSize(width:width,height:height)
    }
        
    //選択した時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
    }
    
    //セルの総数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.cellCount(startDate:startDate)
    }
        
        
    //セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell:CalendarCell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectCell",for:indexPath as IndexPath) as! CalendarCell
            
        //土曜日は赤　日曜日は青　にテキストカラーを変更する
        if(indexPath.row % 7 == 0){
                cell.textLabel.textColor = UIColor.red
            }else if(indexPath.row % 7 == 6){
                cell.textLabel.textColor = UIColor.blue
            }else{
                cell.textLabel.textColor = UIColor.gray
            }
            cell.tag = Int(dateManager.monthTag(row:indexPath.row,startDate:startDate))!
            //セルの日付を取得し
            cell.textLabel.text = dateManager.conversionDateFormat(row:indexPath.row,startDate:startDate)

            //セルの日付を取得
            let day = Int(dateManager.conversionDateFormat(row:indexPath.row,startDate:startDate!))!
            if(day == 1){
                    cell.textLabel.border(positions:[.Top,.Left],borderWidth:1,borderColor:UIColor.black)
            }else if(day <= 7){
                    cell.textLabel.border(positions:[.Top],borderWidth:1,borderColor:UIColor.black)
            }else{
                    cell.textLabel.border(positions:[.Top],borderWidth:0,borderColor:UIColor.white)
            }
            return cell
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let visibleCell = myCollectView.visibleCells.filter{
                return myCollectView.bounds.contains($0.frame)
            }
            
            var visibleCellTag = Array<Int>()
            if(visibleCell != []){
                visibleCellTag = visibleCell.map{$0.tag}
                //月は奇数か偶数か　割り切れるものだけを取り出す
                let even = visibleCellTag.filter{
                    return $0 % 2 == 0
                }
                let odd = visibleCellTag.filter{
                    return $0 % 2 != 0
                }
                //oddかevenの多い方を返す
                let month = even.count >= odd.count ? even[0] : odd[0]
                
                //桁数によって分岐
                let digit = numberOfDigit(month: month)
                if(digit == 5){
                    monthLabel.text = String(month / 10) + "年" + String(month % 10) + "月"
                }else if(digit == 6){
                    monthLabel.text = String(month / 100) + "年" + String(month % 100) + "月"
                }
            }
    }
    
    func numberOfDigit(month:Int) -> Int{
        var num = month
        var cnt = 1
        while(num / 10 != 0){
            cnt = cnt + 1
            num = num / 10
        }
        return cnt
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

    
    
}
