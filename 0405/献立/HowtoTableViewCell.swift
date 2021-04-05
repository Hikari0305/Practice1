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
}

class HowtoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxImage2: UIImageView!
    @IBOutlet weak var recipeDetailLabel2: UILabel!
    let showPrepareButton: MyButton = MyButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxImage2.contentMode = UIView.ContentMode.scaleAspectFill
        //折り返しアリに設定
        recipeDetailLabel2.lineBreakMode = NSLineBreakMode.byWordWrapping
        //cell内で改行
        recipeDetailLabel2.numberOfLines=0
        let btny = (self.frame.height - recipeDetailLabel2.frame.height)/2
        //44はチェックボックスの高さ、幅と一緒
        showPrepareButton.frame = CGRect(x: 360, y: btny, width: 44, height: 44)
        showPrepareButton.backgroundColor = .red
        
        self.addSubview(showPrepareButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
