//
//  ChatInputAccessoryView.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/05.
//

import UIKit

protocol ChatInputAccessoryViewDelegate {
    func tappedSendButton(text: String)
    }

class ChatInputAccessoryView: UIView {
    
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func tappedSendButton(_ sender: Any) {
        guard let text = chatTextView.text else { return }
        delegate?.tappedSendButton(text: text)
    }
    
    weak var delegate: ChatInputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibInit()
        setupViews()
        autoresizingMask = .flexibleHeight
    }
    
    private func setupView() {
        chatTextView.layer.cornerRadius = 15
        //メッセージを送るボックスの枠の色
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        //メッセージを送るボックスの枠の幅
        chatTextView.layer.borderWidth = 15
        chatTextView.imageView?.contentMode = .scaleAspectFill
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.isEnabled = false
        
        //メッセージを入力するボックスを押したとき、最初は何も入力されていないようにする
        chatTextView.text = ""
        chatTextView.delegate = self
    
    }
    
    func removeText() {
        chatTextView.text = ""
        sendButon.isEnabled = false
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    private func nibInit() {
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return
        }
    
    view.frame = self.bounds
        view.authoresizingMask = [flexibleHeight, .flexibleWidth]
        self.addSubView(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatInputAccessoryView: UITextViewDelegate {
    
    //メッセージを入力していない時は送るボタンが押せない、入力するすると押せるようになる
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
    }
}
