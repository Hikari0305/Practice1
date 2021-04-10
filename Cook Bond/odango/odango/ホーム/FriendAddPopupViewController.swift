//
//  FriendAddPopupViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/05.
//

import UIKit

//このクラスは多分いらないです
class FriendAddPopupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            if tag == 1 {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

