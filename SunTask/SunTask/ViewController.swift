//
//  ViewController.swift
//  SunTask
//
//  Created by shiho on 2021/03/12.
//

import UIKit


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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("[debug] viewDidLoad is called.")
        
        guard let uiImage = UIImage(named: "regular_img001_1.jpg"), let ciImg = uiImage.ciImage ?? CIImage(image: uiImage) else { return }
        ciImage = ciImg
        
        imageView.image = uiImage
        
        
        //getModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onTouchedInside(_ sender: Any) {
        ciFilter = CIFilter(name: "CIPhotoEffectProcess")
        if (isSelected) {
            imageView.image = UIImage(named: "regular_img001_1.jpg")
        }
        else
        {
            if (ciFilter != nil) {
                ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
            }
            
            if let filteredImage=ciFilter.outputImage {
                imageView.image = UIImage(ciImage: filteredImage)
            }
        }
        
        isSelected = !isSelected
        
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

