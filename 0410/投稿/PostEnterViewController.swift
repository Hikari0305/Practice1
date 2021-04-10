//
//  PostEnterViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/30.
//

import UIKit

class PostEnterViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var postEnterScroll: UIScrollView!
    
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var cookTimeTextField: UITextField!
    @IBOutlet weak var sortChoosePicker: UIPickerView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var chooseImageButton: UIButton!
    @IBOutlet weak var addMaterialButton: UIButton!
    @IBOutlet weak var materialsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSV()
    }
    
    func createContentsView() -> UIView {
        //        let margin = 8
        //
        let postEnterScrollWidth = self.postEnterScroll.frame.width
        //        let textFieldHeight = 34
        
        let postEnterView = UIView()
        postEnterView.frame = CGRect(x: 0, y: 0, width: Int(postEnterScrollWidth), height: 1400)
        self.postEnterScroll.addSubview(postEnterView)
        self.recipeTitleTextField.addSubview(postEnterView)
        self.cookTimeTextField.addSubview(postEnterView)
        self.sortChoosePicker.addSubview(postEnterView)
        self.recipeImageView.addSubview(postEnterView)
        
        
        let myrecipeView_width = postEnterView.frame.width
        
        return postEnterView
    }
    
    func configureSV() {
        // scrollViewにcontentsViewを配置させる
        let subView = self.createContentsView()
        self.postEnterScroll.addSubview(subView)
        
        // scrollViewにcontentsViewのサイズを教える
        self.postEnterScroll.contentSize = subView.frame.size
    }
    @IBAction func tappedChooseImage(_ sender: Any) {
        let generater = UINotificationFeedbackGenerator()
        generater.notificationOccurred(.success)
        showAlert()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func doCamera() {
        let sourceType:UIImagePickerController.SourceType = .camera
        //カメラ利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    func doAlbum() {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        //アルバム利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] as? UIImage != nil {
            let selectedImage = info[.originalImage] as! UIImage
            self.recipeImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    //アラート
    func showAlert() {
        let alertController = UIAlertController(title: "選択", message: "どちらを使用しますか?", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            self.doCamera()
        }
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            self.doAlbum()
        }
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
    }
//    //画面がタッチされたらキーボードを閉じる
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        textField.resignFirstResponder()
//    }
}
