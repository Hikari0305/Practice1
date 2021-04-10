//
//  UserListViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/02.
//

import UIKit
import Firebase
import Nuke

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var startChatButton: UIButton!
    
    private let cellId = "cellId"
    private var users = [User]()
    private var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.tableFooterView = UIView()
        userListTableView.delegate = self
        userListTableView.dataSource = self
        startChatButton.isEnabled = false
        startChatButton.addTarget(self, action: #selector(tappedStartChatButton), for: .touchUpInside)
        
        fetchUserInfoFromFireStore()
    }
    
    @objc func tappedStartChatButton() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let partnerUid = self.selectedUser?.uid else { return }
        let members = [uid, partnerUid]
        
        let docData = [
            "members": members,
            "latestMessageId": "",
            "createAt": Timestamp()
        ] as [String: Any]
        
        Firestore.firestore().collection("ChatRooms").addDocument(data: docData) { (err) in
            if err != nil {
                print("ChatRoom情報の保存に失敗しました")
                return
            }
            self.dismiss(animated: true, completion: nil)
            print("ChatRoom情報の保存に成功しました")
        }
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
                user.uid = snapshot.documentID
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                if uid == snapshot.documentID {
                    return
                }
                self.users.append(user)
                self.userListTableView.reloadData()
                
            })
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserListTableViewCell
        cell.user = users[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startChatButton.isEnabled = true
        let user = users[indexPath.row]
        self.selectedUser = user
    }
}

class UserListTableViewCell: UITableViewCell {
    
    var user: User? {
        didSet {
            usernameLabel.text = user?.username
            if let url = URL(string: user?.profileImageImageUrl ?? "") {
                Nuke.loadImage(with: url, into: userImageView)
            }
            
        }
    }
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
