//
//  HomePageViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var homeScrollView: UIScrollView!
   
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
    
        /*let seasonalRecipe1Image = UIImage(named: "3622-300x300.jpg")
        struct seasonal: Decodable {
            let date = String.self
            let name = String.self
      }
        do {
            let testString = seasonal
            let testData = testString.data(using: .utf8)!
            let recipe = try JSONDecoder().decode(seasonal.self, from: testData)
        } catch {
            print(error)
            print(error.localizedDescription)*/
        }
    
    /*func update (_ :String) {
    
    seasonalRecipe1Label.text =
    
    }
}*/
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
    
    func createContentsView() -> UIView {
        let homeview = UIView()
        let homeview_width = homeScrollView.frame.width
        homeview.frame = CGRect(x: 0, y: 0, width: homeview_width, height: 1000)
        
        
        let margin = 28
        let space = 12
        let syusyoku = UIButton()
        syusyoku.setTitle("pasta and rice", for: UIControl.State.normal)
        let pi = UIImage(named: "3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg")
        syusyoku.layer.cornerRadius = 15
        syusyoku.layer.masksToBounds = true
        syusyoku.setBackgroundImage(pi, for: .normal)
        syusyoku.setTitleColor(UIColor.white, for: .normal) // タイトルの色
        let child_width = (Int(homeview_width) - margin - space)/2
        syusyoku.frame = CGRect(x: margin, y: margin, width: child_width, height: child_width)
        homeview.addSubview(syusyoku)
        syusyoku.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        syusyokuButton = syusyoku
        
        
        let syusai = UIButton()
        syusai.setTitle("main", for: UIControl.State.normal)
        let pi2 = UIImage(named: "1566136304_1.jpeg")
        syusai.setBackgroundImage(pi2, for: .normal)
        syusai.layer.cornerRadius = 15
        syusai.layer.masksToBounds = true
        let syusaix = (margin*2 + child_width)
        syusai.frame = CGRect(x: syusaix, y: margin, width: child_width, height: child_width)
        homeview.addSubview(syusai)
        syusai.addTarget(self, action: #selector(buttonEvent2(_:)), for: UIControl.Event.touchUpInside)
        syusaiButton = syusai
        
        let fukusai = UIButton()
        fukusai.setTitle("side", for: UIControl.State.normal)
        fukusai.setTitleColor(UIColor.white, for: .normal)
        let pi3 = UIImage(named: "e6f4b23c.jpg")
        fukusai.setBackgroundImage(pi3, for: .normal)
        fukusai.layer.cornerRadius = 15
        fukusai.layer.masksToBounds = true
        let fukusaiy = (margin*2 + child_width)
        fukusai.frame = CGRect(x: margin, y: fukusaiy, width: child_width, height: child_width)
        homeview.addSubview(fukusai)
        fukusai.addTarget(self, action: #selector(buttonEvent3(_:)), for: UIControl.Event.touchUpInside)
        fukusaiButton = fukusai
        
        let sirumono = UIButton()
        sirumono.setTitle("soup", for: UIControl.State.normal)
        let pi4 = UIImage(named: "e6f4b23c.jpg")
        sirumono.layer.cornerRadius = 15
        sirumono.layer.masksToBounds = true
        sirumono.setBackgroundImage(pi4, for: .normal)
        sirumono.frame = CGRect(x: syusaix, y: fukusaiy, width: child_width, height: child_width)
        homeview.addSubview(sirumono)
        sirumono.addTarget(self, action: #selector(buttonEvent4(_:)), for: UIControl.Event.touchUpInside)
        sirumonoButton = sirumono
        
        let seasonalRecipe = UILabel()
        seasonalRecipe.text = "Seasonal Recipes"
        let seasonalRecipey = margin*3 + child_width*2
        let seasonalRecipe_width = Int(homeview_width) + margin/2
        seasonalRecipe.frame = CGRect(x: 14, y: seasonalRecipey, width: seasonalRecipe_width, height: 40)
        seasonalRecipe.font = seasonalRecipe.font.withSize(25)
        seasonalRecipe.backgroundColor = .systemGray5
        homeview.addSubview(seasonalRecipe)
        
        let seasonalScrollView = UIScrollView()
        let seasonalScrollViewy = seasonalRecipey + margin + 40
        seasonalScrollView.frame = CGRect(x: 14, y: seasonalScrollViewy, width: Int(seasonalRecipe_width
        ), height: child_width)
        //seasonalScrollView.backgroundColor = .red
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
        preferences.font = seasonalRecipe.font.withSize(25)
        preferences.backgroundColor = .systemGray5
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
        let syusyoku = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(syusyoku, animated: true)
    }
    
    @objc func buttonEvent2(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let syusai = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(syusai, animated: true)
    }
    
    @objc func buttonEvent3(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let fukusai = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(fukusai, animated: true)
    }
    @objc func buttonEvent4(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let sirumono = storyboard.instantiateViewController(withIdentifier: "sortController") as! sortViewController
        self.navigationController?.pushViewController(sirumono, animated: true)
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
