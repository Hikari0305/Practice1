//
//  CalendarCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/02/28.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    public var textLabel:UILabel!
    
    required init(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)!
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        //UILabelを作成
        textLabel = UILabel()
        textLabel.frame = CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height)
        textLabel.textAlignment = .center
        self.contentView.addSubview(textLabel!)
    
    }
}
