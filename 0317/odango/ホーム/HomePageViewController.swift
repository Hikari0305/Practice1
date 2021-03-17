//
//  HomePageViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class HomePageViewController: UIViewController {
    
    //ここにSeasonal Imageの画像を”SeasonalRecipe1Image”と紐付け
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SeasonalImage1 = UIImage(named: "")
        SeasonalRecipe1Image.setBackgroundImage(SeasonalImage1, for: .normal)
        
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
