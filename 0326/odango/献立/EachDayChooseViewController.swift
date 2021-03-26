//
//  EachDayChooseViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/18.
//

import UIKit

class EachDayChooseViewController: UIViewController {
    
    
    @IBOutlet weak var chooseImage1: UIImageView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var chooseImage2: UIImageView!
    @IBOutlet weak var chooseLabel2: UILabel!
    @IBOutlet weak var chooseImage3: UIImageView!
    @IBOutlet weak var chooseLabel3: UILabel!
    @IBOutlet weak var chooseImage4: UIImageView!
    @IBOutlet weak var chooseLabel4: UILabel!
    
    @IBOutlet weak var chooseSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseImage1.layer.cornerRadius = 15
        chooseImage1.layer.masksToBounds = true
        
        chooseImage2.layer.cornerRadius = 15
        chooseImage2.layer.masksToBounds = true
        
        chooseImage3.layer.cornerRadius = 15
        chooseImage3.layer.masksToBounds = true
        
        chooseImage4.layer.cornerRadius = 15
        chooseImage4.layer.masksToBounds = true
        
        chooseSegmented.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor:UIColor(red: 254, green: 126, blue: 121, alpha: 0.1)], for: .normal)
        
        guard let uiImage = UIImage(named: "sample"), let ciImg = uiImage.ciImage ?? CIImage(image: uiImage) else { return }
        
        
    }
    
    
    @IBAction func tapDishSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //Main押した時の処理
            print("mainが押されました")
            break
        case 1:
            //Side押した時の処理
            print("sideが押されました")
            break
        case 2:
            //Soup押した時の処理
            let setButton = UIButton()
            setButton.frame = CGRect(x: 138, y: 656, width: 137, height: 40)
            //color Literal
            setButton.backgroundColor = #colorLiteral(red: 1, green: 0.7649403214, blue: 0, alpha: 1)
            setButton.setTitleColor(UIColor.white, for: .normal)
            setButton.layer.cornerRadius = 15
            setButton.layer.masksToBounds = true
            print("Soupが押されました")
            break
        default:
            break
        }
    }
       
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
           
        self.view.endEditing(true)
    }
    
    @IBAction func tapFilterButton(_ sender: UIButton) {
    
    // 画面におけるBaseViewの部分を切り取り描画する
        var screenshot: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.chooseImage1.frame.size, false, UIScreen.main.scale)
        if let imageContext = UIGraphicsGetCurrentContext() {
            imageContext.translateBy(x: -self.view.frame.origin.x, y: -self.view.frame.origin.y)
            self.chooseImage1.layer.render(in: imageContext)
            screenshot = UIGraphicsGetImageFromCurrentImageContext()
        }
        screenshot = UIGraphicsGetImageFromCurrentImageContext()
           
        screenshot?.draw(in: self.chooseImage1.frame)
           
           // 描画したContextを取得し、Filterをかける。
           guard let context = UIGraphicsGetCurrentContext(),
               let originalImage = context.makeImage(),
               let bwFilter = CIFilter(name: "CILanczosScaleTransform") else {
                   return UIGraphicsEndImageContext()
           }
           
           let ciImage = CIImage(cgImage: originalImage)
           bwFilter.setValue(ciImage, forKey: kCIInputImageKey)
           // 彩度を下げる
           bwFilter.setValue(NSNumber(value: 0.0), forKey: kCIInputSaturationKey)
           
           // Contextにフィルターをかけ、UIImageを描画する。
           if let bwFilterOutput = bwFilter.outputImage {
               let outputImage: UIImage = UIImage(ciImage: bwFilterOutput)
               outputImage.draw(in: self.chooseImage1.frame)
               
               self.chooseImage1.image = outputImage
           }
           UIGraphicsEndImageContext()
       }
    
    
   
    @IBAction func tapFilterButton2(_ sender: Any) {
    
    
    // 画面におけるBaseViewの部分を切り取り描画する
        var screenshot: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.chooseImage2.frame.size, false, UIScreen.main.scale)
        if let imageContext = UIGraphicsGetCurrentContext() {
            imageContext.translateBy(x: -self.view.frame.origin.x, y: -self.view.frame.origin.y)
            self.chooseImage2.layer.render(in: imageContext)
            screenshot = UIGraphicsGetImageFromCurrentImageContext()
        }
        screenshot = UIGraphicsGetImageFromCurrentImageContext()
           
        screenshot?.draw(in: self.chooseImage2.frame)
           
        // 描画したContextを取得し、Filterをかける。
        guard let context = UIGraphicsGetCurrentContext(),
            let originalImage = context.makeImage(),
            let bwFilter = CIFilter(name: "CIColorControls") else {
                return UIGraphicsEndImageContext()
        }
           
        let ciImage = CIImage(cgImage: originalImage)
        bwFilter.setValue(ciImage, forKey: kCIInputImageKey)
        // 彩度を下げる
        bwFilter.setValue(NSNumber(value: 0.0), forKey: kCIInputSaturationKey)
           
        // Contextにフィルターをかけ、UIImageを描画する。
        if let bwFilterOutput = bwFilter.outputImage {
            let outputImage: UIImage = UIImage(ciImage: bwFilterOutput)
            outputImage.draw(in: self.chooseImage2.frame)
               
            self.chooseImage2.image = outputImage
        }
        UIGraphicsEndImageContext()
    }

}
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


