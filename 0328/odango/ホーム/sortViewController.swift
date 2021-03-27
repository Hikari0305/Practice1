//
//  syusaiViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/07.
//

import UIKit

class sortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sortPageScroll: UIScrollView!
    @IBOutlet weak var sortTable: UITableView!
    @IBOutlet weak var recipe1: UIButton!
    @IBOutlet weak var recipe1Image: UIImageView!
    @IBOutlet weak var recipe1Time: UILabel!
    @IBOutlet weak var recipe1Calorie: UILabel!
    
    @IBOutlet weak var recipe2: UIButton!
    @IBOutlet weak var recipe2Time: UILabel!
    @IBOutlet weak var recipe2Calorie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*        for i in 0..<10 {
            recipe1.setTitle(name, for: .normal)
            recipe1Time.currentTitle = time
            recipe1Calorie.currentTitle = calorie
        }
        recipe1.setTitle(name, for: .normal)
        recipe1Time.currentTitle = time
        recipe1Calorie.currentTitle = calorie
        recipe2.setTitle(name, for: .normal)
        recipe2Time.currentTitle = time
        recipe2Calorie.currentTitle = calorie*/
    }
        
//    override func viewDidAppear(_ animated:Bool) {
//            super.viewDidAppear(animated)
//
//            if let imageView = recipe1.subviews.compactMap({$0 as? UIImageView}).first {
//                imageView.contentMode = .scaleAspectFill
//            }
//    }
    
//    var test = ["レシピ"]
    //セルをタップした時ハイライトにならないようにする
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            return false
        }
    //セルの数を決めるメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    //セルの高さを決めるメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
      return 520
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sortCell", for: indexPath as IndexPath)
//        cell.textLabel!.text = test[indexPath.row]
        
        let margin = 10
        let space = 2
        let scroll_width = sortPageScroll.frame.width
        
        let nameButton = UIButton()
        let nameButton_height = 40
        nameButton.frame = CGRect(x: margin, y: 0, width: Int(scroll_width), height: nameButton_height)
        
        let timeImage = UIImageView()
        let timeImagey = space + nameButton_height
        timeImage.frame = CGRect(x: margin, y: timeImagey, width: 30, height: 30)
        timeImage.image = UIImage(named: "watch.png")
            return cell
        }
}
