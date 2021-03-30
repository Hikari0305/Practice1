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
        sortTable?.reloadData()
        sortTable.reloadSections(NSIndexSet(index: 2) as IndexSet, with: .none)
        
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
        print(recipeTableInfo.count)
        return recipeTableInfo.count
    }
    //セルの高さを決めるメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
      return 520
    }
    //セルの中身を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        cell.textLabel!.text = test[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sortCell") as? SortTableViewCell {
            let recipeInfo = recipeTableInfo[indexPath.row]
            let recipename = recipeInfo[keyName]!
            let recipetime = recipeInfo[keyTime]!
            let recipecalorie = recipeInfo[keyCalorie]!
            let recipeimage = recipeInfo[keyPath]!
            print("sortCellControllerでは")
            print(recipeimage)
            cell.setCellData(recipename, recipetime, recipecalorie, recipeimage)
            return cell
        }
            return SortTableViewCell()
    }
}
