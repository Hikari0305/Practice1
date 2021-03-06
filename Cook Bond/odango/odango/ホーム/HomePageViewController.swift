//
//  HomePageViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class HomePageViewController: UIViewController, UISearchBarDelegate {

    //セルのサイズ
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: 170, height: 220)
//    }
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    
//    var seasonalRecipeList = ["Chinse soup of bamboo shoots and cabage", "Spring vegetable soup pasta", "Simmered assorted bamboo shoots, chicken and rape blosoms","Rapeseed blossoms in mustard dressing", "Simmered bamboo shoots with dried bonito"]
//    var seasonalImageList = ["IMG_0886.jpg", "IMG_0887.jpg", "IMG_0885.jpg","IMG_0888.jpg","IMG_0802.jpg"]
//    var recipeIDList = ["15", "15", "15", "15", "15", "15"]
    
    private let seasonalCollectionView: UICollectionView = {
        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
//        各々の設計に合わせて調整
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 18
        layout.minimumLineSpacing = 18

        let collectionView = UICollectionView(frame: CGRect(x: 14, y: 470, width: 386, height: 270), collectionViewLayout: layout)
        collectionView.backgroundColor = .white

        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "SeasonalCollectionViewCell")

        return collectionView
    }()
    
    
    // 検索バー編集開始時にキャンセルボタン有効化
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        self.syusyokuButton.isEnabled = false
        self.syusaiButton.isEnabled = false
        self.fukusaiButton.isEnabled = false
        self.sirumonoButton.isEnabled = false
    }
    
    // エンターキーで検索
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    @objc func close (_ sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
        self.syusyokuButton.isEnabled = true
        self.syusaiButton.isEnabled = true
        self.fukusaiButton.isEnabled = true
        self.sirumonoButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    weak var syusyokuButton: UIButton!
    weak var syusaiButton: UIButton!
    weak var fukusaiButton: UIButton!
    weak var sirumonoButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        if let imageView = syusyokuButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill //<-
        }
        if let imageView = syusaiButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill
        }
        if let imageView = fukusaiButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill
        }
        if let imageView = sirumonoButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    func setUp(_ button: UIButton,_ image: UIImage) {
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        button.setBackgroundImage(image, for: .normal)
    }
    
    func labelSetUp(_ label: UILabel) {
        label.font = label.font.withSize(25)
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 1, green: 0.4561446905, blue: 0.4991739988, alpha: 1)
    }
    
    let margin = 28
    let space = 12
    
    func createContentsView() -> UIView {
        let homeview = UIView()
        let homeview_width = homeScrollView.frame.width
        let child_width = (Int(homeview_width) - margin - space)/2
        homeview.frame = CGRect(x: 0, y: 0, width: homeview_width, height: 800)
        
        let syusyoku = UIButton()
        syusyoku.setTitle("pasta and rice", for: UIControl.State.normal)
        let pi = UIImage(named: "3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg")
        syusyoku.frame = CGRect(x: margin, y: margin, width: child_width, height: child_width)
        syusyoku.tag = 0
        homeview.addSubview(syusyoku)
        syusyokuButton = syusyoku
        setUp(syusyoku, pi!)
        
        let syusai = UIButton()
        syusai.setTitle("main", for: UIControl.State.normal)
        let pi2 = UIImage(named: "1566136304_1.jpeg")
        let syusaix = (margin*2 + child_width)
        syusai.frame = CGRect(x: syusaix, y: margin, width: child_width, height: child_width)
        syusai.tag = 0
        homeview.addSubview(syusai)
        syusaiButton = syusai
        setUp(syusai, pi2!)
        
        let fukusai = UIButton()
        fukusai.setTitle("side", for: UIControl.State.normal)
        let pi3 = UIImage(named: "e6f4b23c.jpg")
        let fukusaiy = (margin*2 + child_width)
        fukusai.frame = CGRect(x: margin, y: fukusaiy, width: child_width, height: child_width)
        fukusai.tag = 1
        homeview.addSubview(fukusai)
        fukusaiButton = fukusai
        setUp(fukusai, pi3!)
        
        let sirumono = UIButton()
        sirumono.setTitle("soup", for: UIControl.State.normal)
        let pi4 = UIImage(named: "IMG_0801.jpg")
        sirumono.frame = CGRect(x: syusaix, y: fukusaiy, width: child_width, height: child_width)
        sirumono.tag = 2
        homeview.addSubview(sirumono)
        sirumonoButton = sirumono
        setUp(sirumono, pi4!)
        
        let seasonalRecipe = UILabel()
        seasonalRecipe.text = " Seasonal Recipes"
        let seasonalRecipey = margin*3 + child_width*2
        let seasonalRecipe_width = Int(homeview_width) + margin/2
        seasonalRecipe.frame = CGRect(x: 14, y: seasonalRecipey, width: seasonalRecipe_width, height: 40)
        labelSetUp(seasonalRecipe)
        homeview.addSubview(seasonalRecipe)
       
        return homeview
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSV()
        
        let storyborad = UIStoryboard(name: "SignUp", bundle: nil)
        let nextView = storyborad.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        let nav = UINavigationController(rootViewController: nextView)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        
        let myTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomePageViewController.close(_ :)))
        
        self.view.addGestureRecognizer(myTap)
        self.searchBar.delegate = self
        
        print("addview seasonalCollectionView")
        view.addSubview(self.seasonalCollectionView)
        homeScrollView.addSubview(self.seasonalCollectionView)
        
        print("seasonalCollectionView delegate")
        self.seasonalCollectionView.delegate = self
        print("seasonalCollectionView datasource")
        self.seasonalCollectionView.dataSource = self
        
    }
    
    
    func configureSV() {
            // scrollViewにcontentsViewを配置させる
            let subView = createContentsView()
            homeScrollView.addSubview(subView)
            // scrollViewにcontentsViewのサイズを教える
            homeScrollView.contentSize = subView.frame.size
    }
    
    @objc func buttonEvent(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let view = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(view, animated: true)
        
        switch sender.tag {
        case 0:
            view.setRecipeType(.Main)
            break
        case 1:
            view.setRecipeType(.Side)
            break
        case 2:
            view.setRecipeType(.Soup)
            break
        default:
            break
        }
        
    }
}

//cellに与える情報の設定
extension HomePageViewController: UICollectionViewDataSource {
    
    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return springList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonalCollectionViewCell", for: indexPath) as! CollectionViewCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        cell.isUserInteractionEnabled = true
        return cell
        if springList.count <= indexPath.row {
            return cell
        }
        let recipeId = springList[indexPath.row]
        
        let targetRecipe = commonRecipeList[recipeId]
        if targetRecipe != nil {
            let recipename = targetRecipe![keyName]! as! String
            let recipeimage = targetRecipe![keyPath]! as! String
//            cell.self.setUpContents(textName: recipename, imagepath: recipeimage)
        }
        
        return cell
    }
    
}

//イベントの設定(何もなければ記述の必要なし)
extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("セルがタップされました")
        print("indexpath: ",indexPath.row)
        if springList.count <= indexPath.row {
            return
        }
        let recipeID = springList[indexPath.row]
        if recipeID.isEmpty == true {
            return
        }
        //①storyboardのインスタンス取得
        let storyborad: UIStoryboard = self.storyboard!
        //②遷移先ViewControllerのインスタンス取得
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③画面遷移
        self.navigationController?.pushViewController(nextView, animated: true)
        nextView.updateDataWithID(recipeID)
    }
    func collectionView(_ collectionView: UICollectionView,
                     willDisplay cell: UICollectionViewCell,
                       forItemAt indexPath: IndexPath){
      print("willDisplay")
    }
}


extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    //セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        print("called cell size")
        return CGSize(width: 170, height: 270)
    }

}
