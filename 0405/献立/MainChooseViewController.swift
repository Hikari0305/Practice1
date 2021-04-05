//
//  MainChooseViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/18.
//

import UIKit

//これは暫定です。あとでまとめます。
//スクリーンサイズの取得
let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

class MainChooseViewController: UIViewController {
    
    @IBOutlet weak var chooseImage1: UIImageView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var chooseImage2: UIImageView!
    @IBOutlet weak var chooseLabel2: UILabel!
    @IBOutlet weak var chooseImage3: UIImageView!
    @IBOutlet weak var chooseLabel3: UILabel!
    @IBOutlet weak var chooseImage4: UIImageView!
    @IBOutlet weak var chooseLabel4: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //これはnextボタンの時に呼ばれるイベント関数です
    @IBAction func onButtonTapped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage + 1
        updateContents(nextPage)
    }
    //これはbackButtonが押された時に呼ばれる関数です
    @IBAction func backButtonTaped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage - 1
        updateContents(nextPage)
    }
    
    func updateContents(_ targetPageNum: Int) {
        let contentSize: CGSize = self.pageScrollView.contentSize
        pageScrollView.setContentOffset(CGPoint(x: floor(contentSize.width/3 * CGFloat(targetPageNum)), y: 0), animated: true)
        if targetPageNum == 0 {
            backButton.isHidden = true
            nextButton.isHidden = false
        } else if targetPageNum == 1 {
            backButton.isHidden = false
            nextButton.isHidden = false
        } else if targetPageNum == 2 {
            backButton.isHidden = false
            nextButton.isHidden = true
        } else {
            //do nothing
        }
    }
    var recipeList = ["pasta", "omelette rice", "Yellowtail teriyaki", "scallop cooked rice", "subuta", "curry rice"]
    var imageList = ["3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg", "26fb8d743b3e3e7645a4a947f4db74cb.jpg.webp", "i=https%3A%2F%2Fimage.excite.co.jp%2Fjp%2Ferecipe%2Frecipe%2F0%2F0%2F0075f14723f0ca3a9bcf5062871299b4%2F8e6ae4fb7223467b78bfd88ab8559dc0.jpeg&small=400&quality=100&type=jpeg.jpeg", "recipe.jpg", "48ce791cb0730c93f32136a00f9baccec902737a.jpg", "IMG_21642D891D85-1.jpeg"]
    var tappedList = [false, false, false, false, false, false]
    
    private let collectionView: UICollectionView = {

        //セルのレイアウト設計
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        //各々の設計に合わせて調整
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView( frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.white
        //セルの登録
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
            return collectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageScrollView.delegate = self
        //navigationbarの下からのy座標になる。bar系が全部グレーになってしまったのでやめました。
//        edgesForExtendedLayout = []
        
        //生成したcollectionViewのdataSourceとdelegteを紐づける
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        view.addSubview(collectionView)
        mainView.addSubview(collectionView)
        
        if pageControl.currentPage == 0 {
            backButton.isHidden = true
        } else {
            backButton.isHidden = false
        }
        
        if pageControl.currentPage == 2 {
            nextButton.isHidden = true
        }
        
    }
    
       
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
           
        self.view.endEditing(true)
    }
    
//    @IBAction func tapFilterButton(_ sender: UIButton) {
//
//    // 画面におけるBaseViewの部分を切り取り描画する
//        var screenshot: UIImage?
//        UIGraphicsBeginImageContextWithOptions(self.chooseImage1.frame.size, false, UIScreen.main.scale)
//        if let imageContext = UIGraphicsGetCurrentContext() {
//            imageContext.translateBy(x: -self.view.frame.origin.x, y: -self.view.frame.origin.y)
//            self.chooseImage1.layer.render(in: imageContext)
//            screenshot = UIGraphicsGetImageFromCurrentImageContext()
//        }
//        screenshot = UIGraphicsGetImageFromCurrentImageContext()
//
//        screenshot?.draw(in: self.chooseImage1.frame)
//
//           // 描画したContextを取得し、Filterをかける。
//           guard let context = UIGraphicsGetCurrentContext(),
//               let originalImage = context.makeImage(),
//               let bwFilter = CIFilter(name: "CITemperatureAndTint") else {
//                   return UIGraphicsEndImageContext()
//           }
//
//        let ciImage = CIImage(cgImage: originalImage)
//        bwFilter.setValue(ciImage, forKey: kCIInputImageKey)
//        // 色合い
//        bwFilter.setValue(CIVector(x: 6500, y: CGFloat(truncating: NSNumber(value: 152.0))), forKey: "inputNeutral")
//        bwFilter.setValue(CIVector(x: 6500, y: 0), forKey: "inputTargetNeutral")
//
//           // Contextにフィルターをかけ、UIImageを描画する。
//           if let bwFilterOutput = bwFilter.outputImage {
//               let outputImage: UIImage = UIImage(ciImage: bwFilterOutput)
//               outputImage.draw(in: self.chooseImage1.frame)
//
//               self.chooseImage1.image = outputImage
//           }
//           UIGraphicsEndImageContext()
//       }
    
//    @IBAction func tapFilterButton2(_ sender: Any) {
//
//    // 画面におけるBaseViewの部分を切り取り描画する
//        var screenshot: UIImage?
//        UIGraphicsBeginImageContextWithOptions(self.chooseImage2.frame.size, false, UIScreen.main.scale)
//        if let imageContext = UIGraphicsGetCurrentContext() {
//            imageContext.translateBy(x: -self.view.frame.origin.x, y: -self.view.frame.origin.y)
//            self.chooseImage2.layer.render(in: imageContext)
//            screenshot = UIGraphicsGetImageFromCurrentImageContext()
//        }
//        screenshot = UIGraphicsGetImageFromCurrentImageContext()
//
//        screenshot?.draw(in: self.chooseImage2.frame)
//
//        // 描画したContextを取得し、Filterをかける。
//        guard let context = UIGraphicsGetCurrentContext(),
//            let originalImage = context.makeImage(),
//            let bwFilter = CIFilter(name: "CITemperatureAndTint") else {
//                return UIGraphicsEndImageContext()
//        }
//
//        let ciImage = CIImage(cgImage: originalImage)
//        bwFilter.setValue(ciImage, forKey: kCIInputImageKey)
//        // 色合い
//        bwFilter.setValue(CIVector(x: 6500, y: CGFloat(NSNumber(value: 152.0))), forKey: "inputNeutral")
//        bwFilter.setValue(CIVector(x: 6500, y: 0), forKey: "inputTargetNeutral")
//
//        // Contextにフィルターをかけ、UIImageを描画する。
//        if let bwFilterOutput = bwFilter.outputImage {
//            let outputImage: UIImage = UIImage(ciImage: bwFilterOutput)
//            outputImage.draw(in: self.chooseImage2.frame)
//            self.chooseImage2.image = outputImage
//        }
//        UIGraphicsEndImageContext()
//    }
    
    

}
//cellに与える情報の設定
extension MainChooseViewController: UICollectionViewDataSource {

    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        let imagepath = imageList[indexPath.item]
        let cellText = recipeList[indexPath.item]
        cell.setupContents(textName: cellText, imagepath: imagepath)
        if (tappedList[indexPath.item] == true) {
            cell.setFilter()
        }
        print("cellを返しています")
        return cell
    }
}

//イベントの設定(何もなければ記述の必要なし)
extension MainChooseViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("callされました")
        if tappedList[indexPath.item] {
            tappedList[indexPath.item] = false
        } else {
            tappedList[indexPath.item] = true
        }
//        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
//        cell.onTapped()
        
        collectionView.reloadItems(at: [indexPath])
    }
}

//cellのサイズの設定
extension MainChooseViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      //ここでは画面の横サイズの半分の大きさのcellサイズを指定
      return CGSize(width: (screenSize.width-50) / 2, height: (screenSize.width-50)/2 + 50)
  }
    
}
extension MainChooseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        let pageControlNumber = pageScrollView.contentOffset.x / pageScrollView.frame.size.width
        if pageControlNumber.truncatingRemainder(dividingBy: 1) == 0 {
            pageControl.currentPage = Int(pageControlNumber)
        }
    }
}
