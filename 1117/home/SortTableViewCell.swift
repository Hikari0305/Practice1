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
        
        self.cookingTime.text = time
        self.calorieLabel.text = calorie
        self.recipeImage.image = UIImage(named: imagepath)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //I wrote it because the touch event does not occur if I just paste the imageview
        self.recipeImage.isUserInteractionEnabled = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
