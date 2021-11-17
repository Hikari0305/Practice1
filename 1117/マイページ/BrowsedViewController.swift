//
//  BrowsedViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/19.
//

import UIKit

class BrowsedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var array = ["hamburger steak"]
    
    @IBOutlet weak var BrowsedList: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.BrowsedList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = self.array[indexPath.row]
        cell.imageView!.image = UIImage(named: "4462576_s.jpg")
        
        let imageWidth = cell.imageView?.frame.width
        if imageWidth != nil {
            let textWidth = cell.frame.width - imageWidth! - 15
            cell.textLabel?.frame = CGRect(x: imageWidth! + 15, y: 5, width: textWidth, height: cell.frame.height)
        }
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BrowsedList.delegate = self
        self.BrowsedList.dataSource = self
    }

}
