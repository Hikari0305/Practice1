//
//  HowtoTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/30.
//

import UIKit

class MyButton: UIButton {
    var row: Int = 0
    var prepareStr: String = ""
    var prepareName: String = ""
    var prepareImage: String = ""
    var prepareMovieName: String = ""
    var prepareMovieEx: String = ""
}

class HowtoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxImage2: UIImageView!
    @IBOutlet weak var recipeDetailLabel2: UILabel!
    let showPrepareButton: MyButton = MyButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.checkBoxImage2.contentMode = UIView.ContentMode.scaleAspectFill
        //Set to wrap
        self.recipeDetailLabel2.lineBreakMode = NSLineBreakMode.byWordWrapping
        //Line breaks in cell
        self.recipeDetailLabel2.numberOfLines=0
        let btny = (self.frame.height - self.recipeDetailLabel2.frame.height)/2
        self.showPrepareButton.frame = CGRect(x: 360, y: btny, width: 44, height: 44)
        let image = UIImage(named: "Jh6zrTBm1vDmEVI1617869322_1617869982.png")
        self.showPrepareButton.setImage(image, for: .normal)
        
        self.addSubview(self.showPrepareButton)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
