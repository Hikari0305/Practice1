//
//  ChatListViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit

class ChatListViewController: UIViewController {
    
    private let celID = "cellID"
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = .rgb(red: 179, green: 217, blue: 255)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped table view")
        let storyboard = UIStoryboard.init(name: "ChatRoom", bundle: nil)
        let chatRoomViewController = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController")
        navigationController?.pushViewController(chatRoomViewController, animated: true)
    }
    
    
}

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var partnerLabel: UILabel!
    @IBOutlet weak var latestMessageLabal: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = 35
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
