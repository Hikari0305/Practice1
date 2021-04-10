//
//  EachDayRecipeViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class EachDayRecipeViewController: UIViewController {
//    UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
    //MenuPageViewController
    
    @IBOutlet var eachdayView: UIView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIButton!
    @IBOutlet weak var recipeImage2: UIButton!
    
    @IBOutlet weak var statusSetRecipeButton: UIButton!
    @IBOutlet weak var statusShoppingButton: UIButton!
    @IBOutlet weak var statusPrepareButton: UIButton!
    @IBOutlet weak var statusCookingButton: UIButton!
    var val = commonDictionary[key2021323]
    lazy var nameData = self.val![keyName]
    lazy var imagePathData = self.val![keyPath]
    var selectedDate: String = "date"
    
    weak var recipeImageButton: UIButton!
    
    var tappedList = [false, false, false, false, false, false]
    
    func buttonAspectFill(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin = 15
        let day_width = self.eachdayView.frame.width - 30
        self.day.font = self.day.font.withSize(40)
        let day_height = 40
        self.day.frame = CGRect(x: margin, y: 110, width: Int(day_width), height: day_height)
        
        self.nameLabel.textColor = .black
        //recipeName.frame = CGRect(x: 15, y: 60, width: recipeName_width, height: recipeName_height)
        
        self.recipeImageButton = self.recipeImage
        self.buttonAspectFill(self.recipeImageButton)
        
        self.recipeImage2.setBackgroundImage(UIImage(named: "IMG_2256.JPG"), for: .normal)
        self.buttonAspectFill(self.recipeImage2)
        
        self.statusSetRecipeButton.setBackgroundImage(UIImage(named: "eO9Cbr8auNC0lAj1617830837_1617830947.png"), for: .normal)
        self.buttonAspectFill(self.statusSetRecipeButton)
        
        self.statusShoppingButton.setBackgroundImage(UIImage(named: "Qlr572rGmtXTc2j1617831052_1617831087.png"), for: .normal)
        self.buttonAspectFill(self.statusShoppingButton)
        print("")
        
        self.statusPrepareButton.setBackgroundImage(UIImage(named: "2OsIqUVw2LhISAd1617714975_1617715018.png"), for: .normal)
        self.buttonAspectFill(self.statusPrepareButton)
        
        self.statusCookingButton.setBackgroundImage(UIImage(named: "2dEyqo40YD1VhiQ1617831281_1617831364.png"), for: .normal)
        self.buttonAspectFill(self.statusCookingButton)
        
        self.day.text = self.selectedDate
        self.nameLabel.text = self.nameData as? String
        
        let image = UIImage(named: self.imagePathData as! String) // tempImagePathという画像
        self.recipeImage.setBackgroundImage(image, for: .normal) // 背景に画像をset
        
        self.recipeImage.addTarget(self, action: #selector(EachDayRecipeViewController.self.showRecipeDetail(sender: )), for: .touchUpInside)
        
        //生成したcollectionViewのdataSourceとdelegteを紐づける
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        view.addSubview(collectionView)
//        eachdayView.addSubview(collectionView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //角丸の程度を指定
        self.recipeImage.layer.cornerRadius = 15.0
        
        navigationItem.title = self.selectedDate
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let imageView = self.recipeImageButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill //<-
        }
    }
    
    //selectされたindexPathを受け取り、NextViewControllerに伝える
    fileprivate func moveNextVC(indexPath: IndexPath) {
//        let itemName = nameData[indexPath.row]
//            [indexPath.item]
//        let nextVC = RecipeDetailViewController(name: itemName)
//        present(nextVC, animated: true, completion: nil)
    }
    
//    private let collectionView: UICollectionView = {

        //セルのレイアウト設計
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        //各々の設計に合わせて調整
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 10
//
//        let collectionView = UICollectionView( frame: CGRect(x: 20, y: 175, width: 372, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
//        collectionView.backgroundColor = UIColor.systemPink
//        //セルの登録
//        collectionView.register(EachDayCollectionCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        return collectionView
//    }()
//
    func updateString (_ selectedDate: String) {
        //        day.text = date
        self.selectedDate = selectedDate
        print(selectedDate)

        self.val = commonDictionary[selectedDate]
        if (val != nil) {
            if (self.val![keyName] != nil) {
                self.nameData = self.val![keyName]
            }
            if (self.val![keyPath] != nil) {
                self.imagePathData = self.val![keyPath]
            }
        }

    }

    @objc func showRecipeDetail (sender: Any) {
        let storyborad: UIStoryboard = self.storyboard!
        //②遷移先ViewControllerのインスタンス取得
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③画面遷移
        self.navigationController?.pushViewController(nextView, animated: true)

        nextView.self.updateData(self.selectedDate)
    }

//    //cellの個数設定
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return val!.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! EachDayCollectionCell
//
//        //エラーが出ちゃうので一旦消しておきます
////        let imagepath = nameData[indexPath.item]
////        let cellText = nameData[indexPath.item]
////        cell.setupContents(textName: cellText, imagepath: imagepath)
////        if (tappedList[indexPath.item] == true) {
////            cell.setFilter()
////        }
////        cell.setupContents(textName: cellText)
//
//        return cell
//    }
//
//    //cellのサイズの設定
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! EachDayCollectionCell
//        if tappedList[indexPath.item] {
//            tappedList[indexPath.item] = false
//        } else {
//            tappedList[indexPath.item] = true
//        }
//        //        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
//        //        cell.onTapped()
//
//        collectionView.reloadItems(at: [indexPath])
//        moveNextVC(indexPath: indexPath)
//        showRecipeDetail(sender: cell)
//    }
//
//    //cellの大きさ
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: (screenSize.width-50) / 2, height: (screenSize.width+50)/2)
//    }
}
