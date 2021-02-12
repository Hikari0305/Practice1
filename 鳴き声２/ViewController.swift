//
//  ViewController.swift
//  鳴き声２
//
//  Created by 吉田光 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dogbutton(_sender: AnyObject) {
        switch _sender.label.text{
        case "🐶":
            label.text="ワンワン"
        case "🐱":
            label.text="ニャーニャー"
        case "🐸":
            label.text="ゲロゲロ"
        
        
        
        default:print("Any")
            
    
            
        }
    }
    
    
}

