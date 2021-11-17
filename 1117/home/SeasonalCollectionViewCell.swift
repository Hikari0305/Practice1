//
//  SeasonalCollectionViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/16.
//

import UIKit

class SeasonalCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 170, height: 170)
        image.layer.cornerRadius = 15.0
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 170, width: 170, height: 100)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private func setUp() {
        self.image.contentMode = .scaleAspectFill
        self.image.clipsToBounds = true
        contentView.addSubview(image)
        contentView.addSubview(label)
        image.isUserInteractionEnabled = false
        label.isUserInteractionEnabled = false
        contentView.isUserInteractionEnabled = false
    }
    
    var imagePath: String = "hoge"

    func setUpContents(textName: String, imagepath: String) {
        self.label.text = textName
        self.imagePath = imagepath
        self.image.image = UIImage(named: imagePath)
    }
    
}
