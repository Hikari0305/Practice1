//
//  ChatRoomTableViewCell.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/04.
//

import UIKit
import Firebase
import Nuke

class ChatRoomTableViewCell: UITableViewCell {
    
    var message : Message? {
        didSet {
//            if let message = message {
//                partnerMessageTextView.text = message.message
//
//                let width = estimateFrameForTextView(text: message.message).width + 60
//                messageTextViewWidthConstraint.constant = width
//                partnerDatelabel.text = dateFormatterForDateLabel(date: message.createdAt.dateValue())
//
//            }
        }
    }
    
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var partnerMessageTextView: UITextView!
    @IBOutlet weak var myMessageTextView: UITextView!
    @IBOutlet weak var partnerDatelabel: UILabel!
    @IBOutlet weak var myDateLabel: UILabel!
    
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var myMessageTextViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        userImageview.layer.cornerRadius = 30
        partnerMessageTextView.layer.cornerRadius = 15
        myMessageTextView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkWhichUserMessage()
    }
    
    private func checkWhichUserMessage() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        if uid == message?.uid {
            partnerMessageTextView.isHidden = true
            partnerDatelabel.isHidden = true
            userImageview.isHidden = true
            myMessageTextView.isHidden = false
            myDateLabel.isHidden = false
            
            if let message = message {
                myMessageTextView.text = message.message
                
                let width = estimateFrameForTextView(text: message.message).width+30
                myMessageTextViewWidthConstraint.constant = width
                myDateLabel.text = dateFormatterForDateLabel(date: message.createdAt.dateValue())

            }
        } else {
            partnerMessageTextView.isHidden = false
            partnerDatelabel.isHidden = false
            userImageview.isHidden = false
            myMessageTextView.isHidden = true
            myDateLabel.isHidden = true
            if let urlString = message?.partneruser?.profileImageImageUrl, let url = URL(string: urlString) {
                Nuke.loadImage(with: url, into: userImageview)
            }
            
            
            if let message = message {
                partnerMessageTextView.text = message.message
                
                let width = estimateFrameForTextView(text: message.message).width+30
                messageTextViewWidthConstraint.constant = width
                partnerDatelabel.text = dateFormatterForDateLabel(date: message.createdAt.dateValue())

            }
        }
    }
    
    //送った文章の長さに合わせてボックスの長さを変える
    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    private func dateFormatterForDateLabel(date: Date) ->String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "Europe/London")
       
        return formatter.string(from: date)
    }
}
