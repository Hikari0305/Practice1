//
//  UserListViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/02.
//

import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var userListTableView: UITableView!
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.delegate = self
        userListTableView.dataSource = self
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    
}
