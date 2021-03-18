//
//  ToukouViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/15.
//

import UIKit
    
class ToukouViewController: UIViewController ,UIScrollViewDelegate{
    
    @IBOutlet weak var ToukouScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    // スクロールビューのコンテンツサイズを指定
        ToukouScrollView.contentSize = CGSize(width:ToukouScrollView.frame.size.width * 3,height: ToukouScrollView.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(_ ToukouScrollView: UIScrollView) {
        pageControl.currentPage = Int(ToukouScrollView.contentOffset.x / ToukouScrollView.frame.size.width)
    }
    
}
        // Do any additional setup after loading the view.
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




