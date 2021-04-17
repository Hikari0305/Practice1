//
//  MainChooseViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/18.
//

import UIKit

//これは暫定です。あとでまとめます。
//スクリーンサイズの取得
let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

class MainChooseViewController: UIViewController {
    
    @IBOutlet weak var chooseImage1: UIImageView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var chooseImage2: UIImageView!
    @IBOutlet weak var chooseLabel2: UILabel!
    @IBOutlet weak var chooseImage3: UIImageView!
    @IBOutlet weak var chooseLabel3: UILabel!
    @IBOutlet weak var chooseImage4: UIImageView!
    @IBOutlet weak var chooseLabel4: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var soupView: UIView!
    @IBOutlet weak var pageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var setMenuButton: UIButton!
    
    var viewWidth: CGFloat = 0
    var selectedDate: String = ""
    
    //これはnextボタンの時に呼ばれるイベント関数です
    @IBAction func onButtonTapped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage + 1
        updateContents(nextPage)
    }
    //これはbackButtonが押された時に呼ばれる関数です
    @IBAction func backButtonTaped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage - 1
        updateContents(nextPage)
    }
    
    func setDate(_ selectedDate: String){
        self.selectedDate = selectedDate
    }
    
    func updateContents(_ targetPageNum: Int) {
        let contentSize: CGSize = self.pageScrollView.contentSize
        pageScrollView.setContentOffset(CGPoint(x: floor(contentSize.width/3 * CGFloat(targetPageNum)), y: 0), animated: true)
        if targetPageNum == 0 {
            backButton.isHidden = true
            nextButton.isHidden = false
            setMenuButton.isHidden = true
        } else if targetPageNum == 1 {
            backButton.isHidden = false
            nextButton.isHidden = false
            setMenuButton.isHidden = true
        } else if targetPageNum == 2 {
            backButton.isHidden = false
            nextButton.isHidden = true
            setMenuButton.isHidden = false
        } else {
            //do nothing
        }
    }
    //これはmainの料理です
    var recipeList = ["Carbonara", "omelette rice", "Yellowtail teriyaki","cream stew with chicken", "scallop cooked rice", "curry rice"]
    var imageList = ["3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg", "26fb8d743b3e3e7645a4a947f4db74cb.jpg.webp", "i=https%3A%2F%2Fimage.excite.co.jp%2Fjp%2Ferecipe%2Frecipe%2F0%2F0%2F0075f14723f0ca3a9bcf5062871299b4%2F8e6ae4fb7223467b78bfd88ab8559dc0.jpeg&small=400&quality=100&type=jpeg.jpeg","IMG_0830.jpg","recipe.jpg",  "IMG_21642D891D85-1.jpeg"]
    var recipeIDList = ["15", "15", "15", "15", "15", "15"]
    var tappedList = [false, false, false, false, false, false]
    
    //これはsideの料理です
    var recipeList2 = ["potato salad", "takenoko", "kinnpira gobo", "Mizuna and tsuna salad", "ohitasi of nanohana", "salad of abocado, cucumber and tomato"]
    var imageList2 = ["IMG_0804.jpg", "IMG_0802.jpg", "IMG_0800.jpg", "IMG_2256.JPG", "IMG_0888.jpg", "IMG_0838.jpg"]
    var recipeIDList2 = ["26", "26", "26", "26", "26", "26"]
    var tappedList2 = [false, false, false, false, false, false]
    
    //これはsoupの料理です
    var recipeList3 = ["soup of eggplants, carrots and simeji", "wakame soup", "sweet potato soup", "cream soup", "minestrone", "chinese soup of bamboo shoots and cabbage"]
    var imageList3 = ["IMG_0836.jpg", "IMG_0835.jpg", "IMG_0833.jpg", "IMG_0832.jpg", "IMG_0886.jpg", "IMG_0834.jpg"]
    var recipeIDList3 = ["2", "2", "2", "2", "2",
                         "2"]
    var tappedList3 = [false, false, false, false, false, false]
    
    struct recipeData {
        var name = ""
        var imagePath = ""
        var tapped = false
        
    }
    //main料理用のcollectionviewです
    private let collectionView: UICollectionView = {
        
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    //sideメニュー用のcollectionviewです
    private let sideCollectionView: UICollectionView = {
        
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    //soupメニュー用のcollectionviewです
    private let soupCollectionView: UICollectionView = {
        
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageScrollView.delegate = self
        
        self.collectionView.tag = 0
        self.sideCollectionView.tag = 1
        self.soupCollectionView.tag = 2
        //生成したcollectionViewのdataSourceとdelegteを紐づける
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.sideCollectionView.delegate = self
        self.sideCollectionView.dataSource = self
        self.soupCollectionView.delegate = self
        self.soupCollectionView.dataSource = self
        
        view.addSubview(self.collectionView)
        view.addSubview(self.sideCollectionView)
        view.addSubview(self.soupCollectionView)
        self.mainView.addSubview(self.collectionView)
        self.sideView.addSubview(self.sideCollectionView)
        self.soupView.addSubview(self.soupCollectionView)
        
        self.backButton.isHidden = true
        self.setMenuButton.isHidden = true
        
        self.viewWidth = self.pageScrollView.frame.width
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationItem.title = self.selectedDate
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    @IBAction func setMenu(_ sender: Any) {
        print("今からsetMenuが始まるよ")
        var i = 0
        var idList = [String]()
        
        for item in tappedList {
            if item == true {
                let recipe = recipeList[i]
                let path = imageList[i]
                let id = recipeIDList[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        print("------------------")
        i = 0
        for item in tappedList2 {
            if item == true {
                let recipe = recipeList2[i]
                let path = imageList2[i]
                let id = recipeIDList2[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        print("------------------")
        i = 0
        for item in tappedList3 {
            if item == true {
                let recipe = recipeList3[i]
                let path = imageList3[i]
                let id = recipeIDList3[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        commonDictionary[selectedDate] = ["id": idList]
        print(selectedDate)
        print(commonDictionary)
    }
}
//cellに与える情報の設定
extension MainChooseViewController: UICollectionViewDataSource {
    
    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        var imagepath = ""
        var cellText = ""
        print("called collectionView")
        print(collectionView.tag)
        switch collectionView.tag {
        case 0:
            imagepath = self.imageList[indexPath.item]
            cellText = self.recipeList[indexPath.item]
            break
        case 1:
            imagepath = self.imageList2[indexPath.item]
            cellText = self.recipeList2[indexPath.item]
            break
        case 2:
            imagepath = self.imageList3[indexPath.item]
            cellText = self.recipeList3[indexPath.item]
            break
        default: break
                
        }
        
        cell.self.setupContents(textName: cellText, imagepath: imagepath)
        if (tappedList[indexPath.item] == true) {
            cell.setFilter()
            cell.updateCheckStatus(true)
        }
        return cell
    }
    
}

//イベントの設定(何もなければ記述の必要なし)
extension MainChooseViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            if tappedList[indexPath.item] {
                tappedList[indexPath.item] = false
            } else {
                tappedList[indexPath.item] = true
                
            }
            break
        case 1:
            if tappedList2[indexPath.item] {
                tappedList2[indexPath.item] = false
            } else {
                tappedList2[indexPath.item] = true
            }
            break
        case 2:
            if tappedList3[indexPath.item] {
                tappedList3[indexPath.item] = false
            } else {
                tappedList3[indexPath.item] = true
            }
            break
        default: break
                
        }
        
        //        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        //        cell.onTapped()
        
        collectionView.reloadItems(at: [indexPath])
    }
}

//cellのサイズの設定
extension MainChooseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //ここでは画面の横サイズの半分の大きさのcellサイズを指定
        return CGSize(width: (screenSize.width-50) / 2, height: (screenSize.width+50)/2)
    }
    
}
extension MainChooseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        let pageControlNumber = pageScrollView.contentOffset.x / pageScrollView.frame.size.width
        if pageControlNumber.truncatingRemainder(dividingBy: 1) == 0 {
            pageControl.currentPage = Int(pageControlNumber)
        }
    }
}
