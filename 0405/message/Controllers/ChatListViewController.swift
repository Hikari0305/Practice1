//
//  ChatListViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit
import Firebase
import Nuke

class ChatListViewController: UIViewController {
    
    private let cellID = "cellID"
    private var chatrooms = [ChatRoom]()
    
    private var user: User? {
        didSet {
            navigationItem.title = user?.username
        }
    }
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        confirmLoggedInUser()
        fetchLoginUserInfo()
        fetchChatroomsInfoFromFirestore()
    }
    
    private func fetchChatroomsInfoFromFirestore() {
        Firestore.firestore().collection("ChatRooms")
            .addSnapshotListener { (snapshots, err) in
                
                //            .getDocuments { (snapshots, err) in
                if err != nil {
                    print("ChatRoom情報の取得に失敗しました")
                    return
                }
                
                snapshots?.documentChanges.forEach({ (documentChange) in
                    switch documentChange.type {
                    case .added:
                        self.handleAddedDocumentChange(documentChange: documentChange)
                    case .modified, .removed:
                        print("nothing to do")
                    }
                    
                })
                
            }
    }
    
    private func handleAddedDocumentChange(documentChange: DocumentChange) {
        let dic = documentChange.document.data()
            let chatroom = ChatRoom(dic: dic)
        chatroom.documentId = documentChange.document.documentID
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            chatroom.members?.forEach { (memberUid) in
                if memberUid != uid {
                    Firestore.firestore().collection("users").document(memberUid).getDocument {
                        (snapshot,err)in
                        if err != nil {
                            print("ユーザー情報の取得に失敗しました")
                            return
                        }
                        guard let dic = snapshot?.data() else { return }
                        let user = User(dic: dic)
                        user.uid = documentChange.document.documentID
                        
                        chatroom.partnerUser = user
                        self.chatrooms.append(chatroom)
                        print(": ", self.chatrooms.count)
                        self.chatListTableView.reloadData()
                        
                    }
                }
            }
    }
    private func setUpViews() {
        chatListTableView.tableFooterView = UIView()
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        navigationItem.title = "message"
        
        let rightBarButton = UIBarButtonItem(title: "New Chat", style: .plain, target: self, action: #selector(tappedNavRightBarButton))
        navigationItem.rightBarButtonItem = rightBarButton
        let font = UIFont.boldSystemFont(ofSize: 18)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State.normal)
    }
    
    private func confirmLoggedInUser() {
        if Auth.auth().currentUser?.uid == nil {
            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
            let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            signUpViewController.modalPresentationStyle = .fullScreen
//            fetchUserInfoFromFireStore()
        }
    }
    
    @objc private func tappedNavRightBarButton() {
        let storyboard = UIStoryboard.init(name: "UserList", bundle: nil)
        let userListViewController = storyboard.instantiateViewController(identifier: "UserListViewController")
        let nav = UINavigationController(rootViewController: userListViewController)
        
        self.present(nav, animated: true, completion: nil)
    }
    private func fetchLoginUserInfo() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                print("ユーザー情報の取得に失敗しました\(err)")
                return
            }
            guard let snapshot = snapshot, let dic = snapshot.data() else { return }
            
            let user = User(dic:dic)
            self.user = user
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatrooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatListTableViewCell
        cell.chatroom = chatrooms[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped table view")
        let storyboard = UIStoryboard.init(name: "ChatRoom", bundle: nil)
        let chatRoomViewController = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
        chatRoomViewController.user = user
        chatRoomViewController.chatroom = chatrooms[indexPath.row]
        navigationController?.pushViewController(chatRoomViewController, animated: true)
    }
    
    
}

class ChatListTableViewCell: UITableViewCell {
    
//    var user: User? {
//        didSet {
//            if let user = user {
//                partnerLabel.text = user.username
//                dateLabel.text = dateFormatterForDateLabel(date: user.createdAt.dateValue())
//                latestMessageLabal.text = user.email
//            }
//        }
//    }
    
    var chatroom: ChatRoom? {
        didSet {
            if let chatroom = chatroom {
                partnerLabel.text = chatroom.partnerUser?.username
                
                guard let url = URL(string: chatroom.partnerUser?.profileImageImageUrl ?? "") else { return }
                Nuke.loadImage(with: url, into: userImageView)
                
                dateLabel.text = dateFormatterForDateLabel(date: chatroom.createdAt.dateValue())
            }
        }
    }
    
    @IBOutlet weak var partnerLabel: UILabel!
    @IBOutlet weak var latestMessageLabal: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func dateFormatterForDateLabel(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "Europe/London")
       
        return formatter.string(from: date)
    }
    
}
