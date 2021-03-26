//
//  TableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

class ShoppingTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    var ToDo = ["carrot"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let storyborad: UIStoryboard = self.storyboard!

        let nextView = storyborad.instantiateViewController(withIdentifier: "createmenupage")as! EachDayChooseViewController

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = ToDo[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

        // Configure the view for the selected state
}


