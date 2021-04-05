//
//  HomePageViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class HomePageViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLayoutSubviews() {
        /*スクロールする
        let pageSize = homeScrollView.frame.size
        let positionX = pageSize.width * CGFloat()
        let position = CGPoint(x: 0, y: 0)
        homeView.frame = CGRect(origin: position, size: pageSize)
        homeScrollView.contentSize = homeView.frame.size
        homeScrollView.flashScrollIndicators()
        //スクロールする
        seasonalRecipeScrollView.contentSize = seasonalRecipeView.frame.size
        seasonalRecipeScrollView.flashScrollIndicators()*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSV()
        
        let storyborad = UIStoryboard(name: "SignUp", bundle: nil)
        let nextView = storyborad.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(nextView, animated: true, completion: nil)
        
        let myTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomePageViewController.close(_ :)))
        
        self.view.addGestureRecognizer(myTap)
        searchBar.delegate = self
    }
    
    // 検索バー編集開始時にキャンセルボタン有効化
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        syusyokuButton.isEnabled = false
        syusaiButton.isEnabled = false
        fukusaiButton.isEnabled = false
        sirumonoButton.isEnabled = false
    }
    
    // エンターキーで検索
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    @objc func close (_ sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
        syusyokuButton.isEnabled = true
        syusaiButton.isEnabled = true
        fukusaiButton.isEnabled = true
        sirumonoButton.isEnabled = true
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
        label.backgroundColor = .systemGray5
    }
    
    func createContentsView() -> UIView {
        let homeview = UIView()
        let homeview_width = homeScrollView.frame.width
        homeview.frame = CGRect(x: 0, y: 0, width: homeview_width, height: 1000)
        
        let margin = 28
        let space = 12
        let syusyoku = UIButton()
        syusyoku.setTitle("pasta and rice", for: UIControl.State.normal)
        let pi = UIImage(named: "3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg")
        let child_width = (Int(homeview_width) - margin - space)/2
        syusyoku.frame = CGRect(x: margin, y: margin, width: child_width, height: child_width)
        homeview.addSubview(syusyoku)
        syusyokuButton = syusyoku
        setUp(syusyoku, pi!)
        
        let syusai = UIButton()
        syusai.setTitle("main", for: UIControl.State.normal)
        let pi2 = UIImage(named: "1566136304_1.jpeg")
        let syusaix = (margin*2 + child_width)
        syusai.frame = CGRect(x: syusaix, y: margin, width: child_width, height: child_width)
        homeview.addSubview(syusai)
        syusaiButton = syusai
        setUp(syusai, pi2!)
        
        let fukusai = UIButton()
        fukusai.setTitle("side", for: UIControl.State.normal)
        let pi3 = UIImage(named: "e6f4b23c.jpg")
        let fukusaiy = (margin*2 + child_width)
        fukusai.frame = CGRect(x: margin, y: fukusaiy, width: child_width, height: child_width)
        homeview.addSubview(fukusai)
        fukusaiButton = fukusai
        setUp(fukusai, pi3!)
        
        let sirumono = UIButton()
        sirumono.setTitle("soup", for: UIControl.State.normal)
        let pi4 = UIImage(named: "e6f4b23c.jpg")
        sirumono.frame = CGRect(x: syusaix, y: fukusaiy, width: child_width, height: child_width)
        homeview.addSubview(sirumono)
        sirumonoButton = sirumono
        setUp(sirumono, pi4!)
        
        let seasonalRecipe = UILabel()
        seasonalRecipe.text = "Seasonal Recipes"
        let seasonalRecipey = margin*3 + child_width*2
        let seasonalRecipe_width = Int(homeview_width) + margin/2
        seasonalRecipe.frame = CGRect(x: 14, y: seasonalRecipey, width: seasonalRecipe_width, height: 40)
        labelSetUp(seasonalRecipe)
        homeview.addSubview(seasonalRecipe)
        
        let seasonalScrollView = UIScrollView()
        let seasonalScrollViewy = seasonalRecipey + margin + 40
        seasonalScrollView.frame = CGRect(x: 14, y: seasonalScrollViewy, width: Int(seasonalRecipe_width
        ), height: child_width)
        homeview.addSubview(seasonalScrollView)
        
        let seasonalView = UIView()
        let seasonalView_height = 250
        seasonalView.frame = CGRect(x: 0, y: seasonalScrollViewy, width: 1500, height: seasonalView_height)
        seasonalView.backgroundColor = .blue
        
        let label = UILabel()
        let label_x = seasonalView.center.x
        let label_y = seasonalView.center.y
        label.frame = CGRect(x: label_x, y: label_y, width: 200, height: 50)
        label.text = "odango"
        seasonalView.addSubview(label)
        
        
        let seasonalButtun1 = UIButton()
        seasonalButtun1.frame = CGRect(x: margin, y: seasonalScrollViewy, width: seasonalRecipe_width, height: seasonalView_height)
        
        let preferences = UILabel()
        preferences.text = "Preferences"
        let preferencesy = seasonalRecipey + seasonalView_height + margin
        preferences.frame = CGRect(x: 14, y: preferencesy, width: seasonalRecipe_width, height: 40)
        labelSetUp(preferences)
        homeview.addSubview(preferences)
        
        return homeview
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
        let button = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(button, animated: true)
    }
}
    
    //collectionviewがstoryboardでは表示されないから、コードで実行しようとしている
/*extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        return 10
      }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        // Configure the cell
        print("debug")
        return cell
      }

}*/
