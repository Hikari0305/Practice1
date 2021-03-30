//
//  SortTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/28.
//

import UIKit

class SortTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeName: UIButton!
    @IBOutlet weak var cookingTime: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var recipeImage: UIButton!
    
    weak var recipeImageButton: UIButton!
    
    func setCellData (_ name:String, _ time:String, _ calorie:String, _ imagepath:String) {
        self.recipeName.setTitle(name, for: .normal)
        //ボタンの下線
        let underline: [NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.underlineStyle.rawValue):NSUnderlineStyle.single.rawValue]
        let attributeText = NSAttributedString(string: name, attributes: underline)
        recipeName.setAttributedTitle(attributeText, for: .normal)
        
        cookingTime.text = time
        calorieLabel.text = calorie
        recipeImageButton = recipeImage
        
        let image = UIImage(named: imagepath as! String)
        recipeImage.setBackgroundImage(image, for: .normal)
        print("setCellで")
//        print(imagepath)
        
//        self.val = commonDictionary[imagepath]
//        if (val != nil) {
//            if (val![keyPath] != nil) {
//                self.tempImagePath = self.val![keyPath]
//            }
//        }
        
        print("calledsetCellData")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let image = UIImage(named: tempImagePath as! String)
//        recipeImage.setBackgroundImage(image, for: .normal)
        print("awakeFromNibで")
//        print(image as Any)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("calledSetselected")
        // Configure the view for the selected state
    }
}
