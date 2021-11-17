//
//  MaterialTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/08/17.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // セルを初期化するメソッド
    class func initFromNib() -> UITableViewCell {
        // xibファイルのオブジェクトをインスタンス
        let className : String = String(describing: MaterialTableViewCell.self)
        return Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! UITableViewCell
    }
}
