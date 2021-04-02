//
//  PostEnterViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/30.
//

import UIKit

class PostEnterViewController: UIViewController {

    @IBOutlet weak var postEnterScroll: UIScrollView!
    @IBOutlet weak var postEnterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSV()
        // Do any additional setup after loading the view.
    }
    
    func createContentsView() -> UIView {
        let myrecipeView_width = postEnterView.frame.width
        
        
        return postEnterView
    }

    func configureSV() {
            // scrollViewにcontentsViewを配置させる
            let subView = createContentsView()
            postEnterScroll.addSubview(subView)

            // scrollViewにcontentsViewのサイズを教える
            postEnterScroll.contentSize = subView.frame.size
        print("calledconfigureSV")
    }
}
