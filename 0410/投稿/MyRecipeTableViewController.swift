//
//  TableViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/01.
//

import UIKit
//このクラスは多分いらないんです

final class MyRecipeTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdenfier)
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    private let reuseIdenfier = "cell"
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = Array(repeating: "hoge", count: 20)
    }
    @IBOutlet weak var tableViewConstraintheight: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.layoutIfNeeded()
        tableViewConstraintheight.constant = tableView.contentSize.height
        view.frame.size.height = tableView.contentSize.height
    }
}

extension MyRecipeTableViewController: UITableViewDelegate {}

extension MyRecipeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdenfier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

}
