//
//  ChatRoomTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    var message : Message? {
        didSet {
//            guard let text = messageText else { return }
//            let width = estimateFrameForTextView(text: text).width + 60
//
//            messageTextViewWidthConstraint.constant = width
//            messageTextView.text = text
            if let message = message {
                messageTextView.text = message.message
                
                datelabel.text = dateFormatterForDateLabel(date: message.createdAt.dateValue())
//                userImageview.image = 
            }
        }
    }
    
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var datelabel: UILabel!
    
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        userImageview.layer.cornerRadius = 30
        messageTextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //送った文章の長さに合わせてボックスの長さを変える
    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
    private func dateFormatterForDateLabel(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "Europe/London")
       
        return formatter.string(from: date)
    }
}
