//
//  ViewController.swift
//  SunTask
//
//  Created by shiho on 2021/03/12.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

//
// Data struct
//
struct CodableTest {
    
    struct Content {
        var id: Int?
        var title: String?
        var message: String?
    }
    
    private enum RootKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
    
    private enum ItemsKeys: String, CodingKey {
        case id
        case title
        case message
    }
    
    var contents: [Content]?
    var totalCount: Int = 0
}

extension CodableTest: Decodable {
    
    init(from decoder: Decoder) throws {
        self.contents = []
        let root = try decoder.container(keyedBy: RootKeys.self)
        var items = try root.nestedUnkeyedContainer(forKey: .items)
        
        while !items.isAtEnd {
            let container = try items.nestedContainer(keyedBy: ItemsKeys.self)
            var content = Content()
            content.id = try container.decode(Int.self, forKey: .id)
            content.title = try container.decode(String.self, forKey: .title)
            content.message = try container.decode(String.self, forKey: .message)
            self.contents?.append(content)
        }
        totalCount = try root.decode(Int.self, forKey: .totalCount)
    }
}




//
// Main view
//
class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var ciFilter: CIFilter!
    private var ciImage: CIImage!
    private var isSelected: Bool = false
    var playerController = AVPlayerViewController()
    var player = AVPlayer()
    
    private var fileName = "test"
    private var fileEx = "mp4"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // setup imageview
        guard let uiImage = UIImage(named: "regular_img001_1.jpg"), let ciImg = uiImage.ciImage ?? CIImage(image: uiImage) else { return }
        
        self.ciImage = ciImg
        self.imageView.image = uiImage
        
        // setup filter
        self.ciFilter = CIFilter(name: "CIPhotoEffectProcess")
        
        // setup Audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
            
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        
        do {
            try audioSession.setActive(true)
            print("Audio session set active !!")
        } catch {
            
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onTouchedInside(_ sender: Any) {
        if (self.isSelected) {
            self.imageView.image = UIImage(named: "regular_img001_1.jpg")
        }
        else
        {
            if (self.ciFilter != nil) {
                self.ciFilter.setValue(self.ciImage, forKey: kCIInputImageKey)
                // self.ciFilter.setValue(0.1, forKey: kCIInputContrastKey)
                if let filteredImage=self.ciFilter.outputImage {
                    self.imageView.image = UIImage(ciImage: filteredImage)
                }
            }
        }
        
        self.isSelected = !self.isSelected
        
    }
  
    @IBAction func onPlayBtnTouched(_ sender: Any) {
        print("touched play btn!")
        playMovie(fileName: self.fileName, fileExtension: self.fileEx)
    }
    
    // get Model from JSON
    func getModel() {
        print("[debug] getModel is called.")
        let json = """
        {
            "items": [
                {
                    "id": 1,
                    "title": "タイトル1",
                    "message": "メッセージ1",
                },
                {
                    "id": 2,
                    "title": "タイトル2",
                    "message": "メッセージ2",
                }
            ],
            "total_count": 2,
        }
        """
        
        let jsonData=json.data(using: .utf8)
        let result:CodableTest!
        do {
            result=try JSONDecoder().decode(CodableTest.self, from: jsonData!)
        } catch {
            print("[system] json decoding is failed.")
            return
        }
        print("[debug] json decoding is succeed.")
        print("[debug] result: count=\(result.totalCount)")
        
        let hoge = result.contents
        print(type(of: hoge))
        print(hoge![0])
    }
    
}

