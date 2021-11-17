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
        //Set to wrap
        recipeDetailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        //Line breaks in cell
        recipeDetailLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
