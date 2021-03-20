//
//  HomePageViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var homeView: UIView!
    
    @IBOutlet weak var seasonalRecipeScrollView: UIScrollView!
    @IBOutlet weak var seasonalRecipeView: UIView!

    override func viewDidLayoutSubviews() {
        //スクロールする
        homeScrollView.contentSize = homeView.frame.size
        homeScrollView.flashScrollIndicators()
        //スクロールする
        seasonalRecipeScrollView.contentSize = seasonalRecipeView.frame.size
        seasonalRecipeScrollView.flashScrollIndicators()
        
    }
    
    @IBOutlet weak var SeasonalRecipe1Image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SeasonalImage1 = UIImage(named: "3622-300x300.jpg")
        
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
