//
//  DetailTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/30.
//

import UIKit

class IngTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var recipeDetailLabel: UILabel!
    @IBOutlet weak var checkBoxImage2: UIImageView!
    @IBOutlet weak var recipeDetailLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBoxImage.contentMode = UIView.ContentMode.scaleAspectFill
        //折り返しアリに設定
        recipeDetailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        //cell内で改行
        recipeDetailLabel.numberOfLines = 0
        
//        checkBoxImage2.contentMode = UIView.ContentMode.scaleAspectFill
//        //折り返しアリに設定
//        recipeDetailLabel2.lineBreakMode = NSLineBreakMode.byWordWrapping
//        //cell内で改行
//        recipeDetailLabel2.numberOfLines=0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
