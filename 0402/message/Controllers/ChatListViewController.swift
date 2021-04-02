//
//  ChatListViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit
import Firebase

class ChatListViewController: UIViewController {
    
    private let cellID = "cellID"
    private var users = [User]()
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        navigationItem.title = "message"
        
        if Auth.auth().currentUser?.uid == nil {
            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
            let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            signUpViewController.modalPresentationStyle = .fullScreen
//            fetchUserInfoFromFireStore()
        }
        let rightBarButton = UIBarButtonItem(title: "New Chat", style: .plain, target: self, action: #selector(tappedNavRightBarButton))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fetchUserInfoFromFireStore()
    }
    
    @objc private func tappedNavRightBarButton() {
        let storyboard = UIStoryboard.init(name: "UserList", bundle: nil)
        let userListViewController = storyboard.instantiateViewController(withIdentifier: "UserListViewController")
        let chatRoomViewController = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController")
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    private func fetchUserInfoFromFireStore() {
        Firestore.firestore().collection("users").getDocuments {(snapshots, err) in
            if let err = err {
            print("user情報の取得に失敗しました。\(err)")
            return
            }
            
            snapshots?.documents.forEach({ (snapshot) in
                let dic = snapshot.data()
                let user = User.init(dic: dic)
                
                self.users.append(user)
                self.chatListTableView.reloadData()
                
                self.users.forEach {(user) in
                    print("username: ", user.username)
                }
                
            })
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatListTableViewCell
        cell.user = users[indexPath.row]
        
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
    
    var user: User? {
        didSet {
            if let user = user {
                partnerLabel.text = user.username
                dateLabel.text = dateFormatterForDateLabel(date: user.createdAt.dateValue())
                latestMessageLabal.text = user.email
            }
        }
    }
    
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
    
    private func dateFormatterForDateLabel(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "Europe/London")
       
        return formatter.string(from: date)
    }
    
}
