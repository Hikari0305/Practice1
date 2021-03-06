//
//  EachDayRecipeViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class EachDayRecipeViewController: UIViewController {

    @IBOutlet var eachdayView: UIView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIButton!
    @IBOutlet weak var recipeImage2: UIButton!
    
    var val = commonDictionary[key2021323]
    lazy var tempRecipe = val![keyName]
    lazy var tempImagePath = val![keyPath]
    var selectedDate: String = "date"
    
    weak var recipeImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let ___ = __で変数を定義
        //___.frame.widthは___の幅
        
        let margin = 15
        let day_width = eachdayView.frame.width - 30
        day.font = day.font.withSize(40)
//        day.backgroundColor = .systemGray5
        let day_height = 40
        day.frame = CGRect(x: margin, y: 110, width: Int(day_width), height: day_height)
        
        recipeName.textColor = .black
        //recipeName.frame = CGRect(x: 15, y: 60, width: recipeName_width, height: recipeName_height)
        
        recipeImage.layer.masksToBounds = true
        recipeImage.imageView?.contentMode = .scaleAspectFit
        recipeImageButton = recipeImage
        
        recipeImage2.layer.masksToBounds = true
        
        day.text = selectedDate
        recipeName.text = tempRecipe as? String
        
        let image = UIImage(named: tempImagePath as! String) // tempImagePathという画像
        recipeImage.setBackgroundImage(image, for: .normal) // 背景に画像をset
        
        recipeImage.addTarget(self, action: #selector(EachDayRecipeViewController.showRecipeDetail(sender: )), for: .touchUpInside)
        
        print("calledViewdidload")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
        //角丸の程度を指定
        self.recipeImage.layer.cornerRadius = 15.0
        
        navigationItem.title = selectedDate
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        if let imageView = recipeImageButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFill //<-
        }
    }
    
    func updateString (_ selectedDate: String) {
//        day.text = date
        self.selectedDate = selectedDate
        print(selectedDate)
        
        self.val = commonDictionary[selectedDate]
        if (val != nil) {
            if (val![keyName] != nil) {
            self.tempRecipe = self.val![keyName]
            }
            if (val![keyPath] != nil) {
            self.tempImagePath = self.val![keyPath]
            }
        }
        
    }
    
    @objc func showRecipeDetail (sender: Any) {
        let storyborad: UIStoryboard = self.storyboard!
        //②遷移先ViewControllerのインスタンス取得
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③画面遷移
        self.navigationController?.pushViewController(nextView, animated: true)
        
        nextView.updateData(selectedDate)
    }
    
    
    

}
