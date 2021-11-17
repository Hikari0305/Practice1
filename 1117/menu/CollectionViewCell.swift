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
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private let chooseImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: (screenSize.width-50) / 2, height: (screenSize.width-50) / 2)
        image.layer.cornerRadius = 15.0
        return image
    }()
    private let checkImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: (screenSize.width-50) / 2, height: (screenSize.width-50) / 2)
        return image
    }()
    
    var ciFilter: CIFilter!
    var imagePath: String = "hoge"
    var ciImage: CIImage!
    var filterOn: Bool = false
    
    dynamic var filteredImage: CIImage? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        // create CIFilter
        ciFilter = CIFilter(name: "CIPhotoEffectChrome")
        // setup imageview
        guard let uiImage = UIImage(named: "unnamed.jpg"), let ciImg = uiImage.ciImage ?? CIImage(image: uiImage) else { return }
                
        self.ciImage = ciImg
        self.checkImage.image = UIImage(named: "checkImage.png")
        self.checkImage.isHidden = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }


        private func setup() {

            chooseImage.contentMode = .scaleAspectFill
            chooseImage.clipsToBounds = true
            chooseImage.addSubview(checkImage)
            contentView.addSubview(chooseLabel)
            contentView.addSubview(chooseImage)
            chooseLabel.isUserInteractionEnabled = false
            chooseImage.isUserInteractionEnabled = false
        }

    func setupContents(textName: String, imagepath: String) {
        self.chooseLabel.text = textName
        self.imagePath = imagepath
        self.chooseImage.image = UIImage(named: imagePath)
    }
    
    func setFilter() {
        // Input image settings
        guard let uiImage = UIImage(named: imagePath), let ciImg = uiImage.ciImage ?? CIImage(image: uiImage) else { return }
        
        self.ciImage = ciImg
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        self.filteredImage = ciFilter.outputImage
        chooseImage.image = UIImage(ciImage: filteredImage!)
    }
    
    func updateCheckStatus(_ enable: Bool) {
        self.checkImage.isHidden = !enable
    }
}
