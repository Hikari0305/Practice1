//
//  PreparingViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/04.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class PreparingViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var howToVideo: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var playVideoButton: UIButton!
    var name: String? = ""
    var detail: String? = ""
    private var fileName = "プロジェクト (6)"
    private var fileEx = "MP4"
    var playerController = AVPlayerViewController()
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = self.name
        self.detailLabel.text = self.detail
        
        detailLabel.numberOfLines = 0
        detailLabel.sizeToFit()
        
        playVideoButton.setBackgroundImage(UIImage(named: "IMG_0921.JPG"), for: .normal)
    }
    
    private func playMovie(fileName: String, fileExtension: String) {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
                print("Url is nil")
                return
            }
            
            print("play movie!!")
            
            // AVPlayerにアイテムをセット
            let item = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: item)
                
            // 動画プレイヤーにplayerをセット
            playerController.player = player
            
            // 動画プレイヤーを表示して再生
            self.present(playerController, animated: true) {
                self.player.play()
            }
        }
    
    func updateData(_ name: String, _ howTo: String) {
        if nameLabel != nil && detailLabel != nil {
            nameLabel.text = name
            detailLabel.text = howTo
        } else {
            self.name = name
            self.detail = howTo
        }
    }
    
    @IBAction func touchedPlayButton(_ sender: Any) {
        print("touched play btn!")
        playMovie(fileName: self.fileName, fileExtension: self.fileEx)
    }
    
}
