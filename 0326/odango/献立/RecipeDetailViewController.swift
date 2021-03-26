//
//  RecipeDetailViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/24.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var recipeDetailScrollView: UIScrollView!
    @IBOutlet weak var recipeDetailView: UIView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    var ingList2 = ["1", "2"]
    
    @IBOutlet weak var ingredientsTable: UITableView!
    
    var val = common_dictionary[key_2021323]
    lazy var recipe = val![key_name]
    lazy var imagePath = val![key_path]
    lazy var time = val![key_time]
    lazy var calorie = val![key_calorie]
    lazy var ingList: [[String:String]] = val![key_ingList] as! [[String:String]]
    var localDate = "hoge"
    
    func updateData (_ selectedDate:String) {
        localDate = selectedDate
        self.val = common_dictionary[selectedDate]
        if (val != nil) {
            print("valisnotnil")
            if (val![key_name] != nil) {
                self.recipe = self.val![key_name]
            }
            if (val![key_path] != nil) {
                self.imagePath = self.val![key_path]
            }
            if (val![key_time] != nil) {
                self.time = self.val![key_time]
            }
            if (val![key_calorie] != nil) {
                self.calorie = self.val![key_calorie]
            }
            if (val![key_ingList] != nil) {
                self.ingList = self.val![key_ingList] as! [[String:String]]
            }
            
        }
        
        print("calledupdateData")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("called hoge")
        return ingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ingCell", for: indexPath)
        let temp = ingList[indexPath.row]
        let ingname = temp[key_ingname]
        let ingq = temp[key_ingq]
        if ingq != nil, ingname != nil {
            let labelString = ingname! + ":" + ingq!
            cell.textLabel!.text = labelString
        }
        print(indexPath.row)
        return cell
    }
    
    func configureSV() {
            // scrollViewにcontentsViewを配置させる
            let subView = createContentsView()
            recipeDetailScrollView.addSubview(recipeDetailView)
            // scrollViewにcontentsViewのサイズを教える
            //recipeDetailScrollView.contentSize = subView.frame.size
    }
    
    func createContentsView() {
        recipeDetailScrollView.addSubview(recipeDetailView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recipeName.frame = CGRect(x: 15, y: 110, width: 379, height: 40)
        
        recipeName.text = recipe as? String
        recipeImage.image = UIImage(named: imagePath as! String)
        timeLabel.text = time as? String
        calorieLabel.text = calorie as? String

    }
    
    override func viewDidLayoutSubviews() {

      recipeDetailScrollView.contentSize = recipeDetailView.frame.size
      recipeDetailScrollView.flashScrollIndicators()

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
