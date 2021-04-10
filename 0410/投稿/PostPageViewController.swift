//
//  ToukouViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/15.
//

import UIKit
    
class PostPageViewController: UIViewController ,UIScrollViewDelegate {
    
    @IBOutlet var PostView: UIView!
    @IBOutlet weak var postScrollView: UIScrollView!
    @IBOutlet weak var myRecipesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールビューのコンテンツサイズを指定
        self.postScrollView.contentSize = CGSize(width:postScrollView.frame.size.width * 3,height: self.postScrollView.frame.size.height)
        
        let postView_width = PostView.frame.width
        self.myRecipesLabel.frame = CGRect(x: 14, y: 110, width: postView_width - 28, height: 40)
        self.myRecipesLabel.text = "My Recipes"
        self.myRecipesLabel.font = self.myRecipesLabel.font.withSize(25)
        self.myRecipesLabel.textColor = .white
        
        configureSV()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createContentsView() -> UIView {
        let myrecipeView = UIView()
        let myrecipeView_width = postScrollView.frame.width
        myrecipeView.frame = CGRect(x: 0, y: 0, width: myrecipeView_width, height: 1500)
        
        let label = UILabel()
        let label_x = myrecipeView.center.x
        let label_y = myrecipeView.center.y
        label.frame = CGRect(x: label_x, y: label_y, width: 200, height: 50)
        label.text = "odango"
        myrecipeView.addSubview(label)
        return myrecipeView
    }
    
    func configureSV() {
        // scrollViewにcontentsViewを配置させる
        let subView = createContentsView()
        self.postScrollView.addSubview(subView)
        
        // scrollViewにcontentsViewのサイズを教える
        self.postScrollView.contentSize = subView.frame.size
    }
    
}
