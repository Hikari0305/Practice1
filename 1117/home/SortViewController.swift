//
//  syusaiViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/07.
//

import UIKit

enum RecipeType {
    case Pasta
    case Main
    case Side
    case Soup
    case None
}

class sortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sortPageScroll: UIScrollView!
    @IBOutlet weak var sortTable: UITableView!
    
    var recipeType: RecipeType = .None
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortTable?.reloadData()
    }
    
    func setRecipeType(_ type: RecipeType) {
        self.recipeType = type
    }
    
    //cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch recipeType {
        case .Pasta:
            return pastaRecipeIdList.count
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
    //cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 520
    }
    
    func getRecipeId(_ recipeType: RecipeType, _ index: Int) -> String {
        switch recipeType {
        case .Pasta:
            if pastaRecipeIdList.count > index {
                return pastaRecipeIdList[index]
            }
            break
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        //①
        let storyborad: UIStoryboard = self.storyboard!
        //②
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③
        self.navigationController?.pushViewController(nextView, animated: true)
        nextView.updateDataWithID(recipeID)
    }
    
}
