//
//  syusaiViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/07.
//

import UIKit

enum RecipeType {
    case Main
    case Side
    case Soup
    case None
}

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
    
    var recipeType: RecipeType = .None
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortTable?.reloadData()
        //        sortTable.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .none)
        
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
    
    func setRecipeType(_ type: RecipeType) {
        self.recipeType = type
    }
    //    override func viewDidAppear(_ animated:Bool) {
    //            super.viewDidAppear(animated)
    //
    //            if let imageView = recipe1.subviews.compactMap({$0 as? UIImageView}).first {
    //                imageView.contentMode = .scaleAspectFill
    //            }
    //    }
    
    //    var test = ["レシピ"]
    //    セルをタップした時ハイライトにならないようにする
    //    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
    //            return false
    //        }
    //セルの数を決めるメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch recipeType {
        case .Main:
            return mainRecipeIdList.count
        case .Side:
            return sideRecipeIdList.count
        case .Soup:
            return soupRecipeIdList.count
        default:
            break
        }
        return 0
    }
    //セルの高さを決めるメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 520
    }
    
    func getRecipeId(_ recipeType: RecipeType, _ index: Int) -> String {
        switch recipeType {
        case .Main:
            if mainRecipeIdList.count > index {
                return mainRecipeIdList[index]
            }
            break
        case .Side:
            if sideRecipeIdList.count > index {
                return sideRecipeIdList[index]
            }
            break
        case .Soup:
            if soupRecipeIdList.count > index {
                return soupRecipeIdList[index]
            }
            break
        default:
            return ""
        }
        return ""
    }
    //セルの中身を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        cell.textLabel!.text = test[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "sortCell") as? SortTableViewCell {
            
            let recipeId: String = getRecipeId(self.recipeType, indexPath.row)
            
            let targetRecipe = commonRecipeList[recipeId]
            if targetRecipe != nil {
                let recipename = targetRecipe![keyName]! as! String
                let recipetime = targetRecipe![keyTime]! as! String
                let recipecalorie = targetRecipe![keyCalorie]! as! String
                let recipeimage = targetRecipe![keyPath]! as! String
                cell.setCellData(recipename, recipetime, recipecalorie, recipeimage)
                return cell
            }
            
        }
        return SortTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択を解除
        sortTable.deselectRow(at: indexPath, animated: true)
        
        let recipeID = getRecipeId(self.recipeType, indexPath.row)
        if recipeID.isEmpty == true {
            return
        }
        //①storyboardのインスタンス取得
        let storyborad: UIStoryboard = self.storyboard!
        //②遷移先ViewControllerのインスタンス取得
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③画面遷移
        self.navigationController?.pushViewController(nextView, animated: true)
        nextView.updateDataWithID(recipeID)
    }
    
}
