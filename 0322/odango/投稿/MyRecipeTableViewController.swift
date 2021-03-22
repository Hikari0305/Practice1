//
//  TableViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/01.
//

import UIKit
//このクラスは投稿のためのクラスです(謎）

final class MyRecipeTableViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet{
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdenfier)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private let reuseIdenfier = "cell"
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        data = Array(repeating: "hoge", count: 20)
    }
    @IBOutlet weak var tableViewConstraintheight: NSLayoutConstraint!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
