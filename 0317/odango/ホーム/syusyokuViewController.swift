//
//  syusaiViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/07.
//

import UIKit

class syusyokuViewController: UIViewController {

    @IBOutlet weak var recipe1: UIButton!
    @IBOutlet weak var recipe1Image: UIImage!
    @IBOutlet weak var recipe1Time: UILabel!
    @IBOutlet weak var recipe1Calorie: UILabel!
    
    @IBOutlet weak var recipe2: UIButton!
    @IBOutlet weak var recipe2Time: UILabel!
    @IBOutlet weak var recipe2Calorie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..< {
            recipe1.setTitle(name, for: .normal)
            recipe1Time.currentTitle = time
            recipe1Calorie.currentTitle = calorie
        }
        recipe1.setTitle(name, for: .normal)
        recipe1Time.currentTitle = time
        recipe1Calorie.currentTitle = calorie
        recipe2.setTitle(name, for: .normal)
        recipe2Time.currentTitle = time
        recipe2Calorie.currentTitle = calorie

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
