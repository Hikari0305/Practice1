//
//  SortTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/28.
//

import UIKit

class SortTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var cookingTime: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    weak var recipeImageButton: UIButton!
    
    func setCellData (_ name:String, _ time:String, _ calorie:String, _ imagepath:String) {
        self.recipeName.text = name
        //ボタンの下線
        //        let attributedText = NSMutableAttributedString(string: name)
        //        let range = NSMakeRange(0, name.characters.count)
        
        // 下線を引くようの設定をする.
        //        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(5, 2))
        
        // 対象のラベルを作成して、attributedTextを設定する.
        //        let label = UILabel()
        //        label.attributedText = attributedText
        
        cookingTime.text = time
        calorieLabel.text = calorie
        recipeImage.image = UIImage(named: imagepath)
        
        //        let image = UIImage(named: imagepath as! String)
        //        recipeImage.setBackgroundImage(image, for: .normal)
        
        //        self.val = commonDictionary[imagepath]
        //        if (val != nil) {
        //            if (val![keyPath] != nil) {
        //                self.tempImagePath = self.val![keyPath]
        //            }
        //        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        let image = UIImage(named: tempImagePath as! String)
        //        recipeImage.setBackgroundImage(image, for: .normal)
        //imageviewを貼り付けただけだとタッチイベントが発生しないので、書いた
        recipeImage.isUserInteractionEnabled = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
