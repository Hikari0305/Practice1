//
//  CollectionViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/01.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: (screenSize.width-50) / 2, width: (screenSize.width-50) / 2, height: 50)
//        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    private let chooseImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: (screenSize.width-50) / 2, height: (screenSize.width-50) / 2)
        return image
    }()
    
    private var ciFilter: CIFilter!
    var imagePath: String = "hoge"
    
    dynamic var filteredImage: CIImage? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        // CIFilterの生成
        ciFilter = CIFilter(name: "CITemperatureAndTint")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


        private func setup() {
//            layer.borderColor = UIColor.darkGray.cgColor
//            layer.borderWidth = 1.0

            chooseImage.contentMode = .scaleAspectFill
            chooseImage.clipsToBounds = true
            contentView.addSubview(chooseLabel)
            contentView.addSubview(chooseImage)
//            contentView.addSubview(chooseButton)
//            chooseImage.addSubview(chooseButton)
        }

    func setupContents(textName: String, imagepath: String) {
        chooseLabel.text = textName
        chooseImage.image = UIImage(named: imagepath)
        let ciImage = chooseImage.image?.ciImage ?? CIImage(image: chooseImage.image!)
        // 入力画像の設定
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
//        ciFilter.setValue(70, forKey: kCIInputContrastKey)
        filteredImage = ciFilter.outputImage
        self.imagePath = imagepath
        }
    
    func onTapped(_ filterOn: Bool) {
        if filterOn == true {
            chooseImage.image = UIImage(ciImage: filteredImage!)
        } else {
            chooseImage.image = UIImage(named: imagePath)
        }
    }
}
