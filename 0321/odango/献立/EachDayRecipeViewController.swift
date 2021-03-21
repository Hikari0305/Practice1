//
//  EachDayRecipeViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class EachDayRecipeViewController: UIViewController {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var temp: String = "hoge"
    var tempRecipe :String = "curry"
    var tempImagePath: String = "1566136304_1.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        day.text = temp
        recipeName.text = tempRecipe
        recipeImage.image = UIImage (named: tempImagePath
        )
        print("calledViewdidload")
    }
    
    func updateString (_ date: String, _ name: String, _ imagePath: String) {
//        day.text = date
        self.temp = date
        self.tempRecipe = name
        self.tempImagePath = imagePath
        print(temp)
        print("called updatestring")
    }
    

}
