//
//  CalenderCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/02/28.
//

import UIKit

class Calendercell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
    textLabel.font = UIFont(name: "HIraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
    self.addSubview(textLabel!)
}

override init(frame: CGRect) {
    super.init(frame: frame)
}

}
