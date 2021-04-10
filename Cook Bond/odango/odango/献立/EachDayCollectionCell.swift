//
//  EachDayCollectionCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/08.
//

import UIKit

class EachDayCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: (screenSize.width-50)/2, width: (screenSize.width-50)/2, height: 50)
        label.textAlignment = .center
        return label
    }()
    
    private func setup() {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 3.0
        
        contentView.addSubview(label)
    }
    
    func setupContents(textName: String) {
        label.text = textName
    }
}
