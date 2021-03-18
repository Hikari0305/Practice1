//
//  ChatRoomViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    private let cellID = "cellID"
    private var messages = [String]()
    
    private lazy var chatInputAccessoryView: ChatInputAccessoryView = {
        let view = ChatInputAccessoryView()
        view.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        view.delegate = self
    }()
    
    @IBOutlet weak var chatRoomTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
        //chatRoomTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        chatRoomTableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        chatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
    }
    
    override var inputAccessoryView: UIView? {
        get {
            return chatInputAccessoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }

}

extension ChatRoomViewController: ChatInputAccessoryViewDelegate {
    func tappedSendButton(text: String) {
        messages.append(text)
        chatInputAccessoryView.removeText()
     
            //文字を打って送ると、相手側の方に「ここにメッセージが入ります、と出てくるようになる
        chatRoomTableView.reloadData()
            }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        chatRoomTableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatRoomTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatRoomTableViewCell
        // cell.messageTextView.text = messages[indexPath.row]
        cell.messageText = messages[indexPath.row]
        return cell
    }
    
    
}
