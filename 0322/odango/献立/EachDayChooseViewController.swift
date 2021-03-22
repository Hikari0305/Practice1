//
//  EachDayChooseViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/18.
//

import UIKit

class EachDayChooseViewController: UIViewController {
    
    @IBOutlet weak var ChooseRecipe1Image: UIImage?
    @IBOutlet weak var ChooseRecipe1Label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapDishSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //Main押した時の処理
            print("mainが押されました")
            break
        case 1:
            //Side押した時の処理
            print("sideが押されました")
            break
        case 2:
            //Soup押した時の処理
            print("Soupが押されました")
            break
        default:
            break
        }
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
