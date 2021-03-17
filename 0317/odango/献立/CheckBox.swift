//
//  CheckBox.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/16.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(named: "Checkmark@3x.png")! as UIImage
        let uncheckedImage = UIImage(named: "Checkmarkempty@3x.png")! as UIImage
        
        // Bool property
    var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControlState.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControlState.normal)
                }
            }
        }

        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
        }

        func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
            
            
        }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */



}
    
