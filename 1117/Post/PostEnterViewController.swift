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
    
    // セルのオブジェクトを格納する配列
    var cellArray : NSMutableArray = NSMutableArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.materialsTableView.delegate = self
        //self.materialsTableView.dataSource = self
        configureSV()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createContentsView() -> UIView {

        let postEnterScrollWidth = self.postEnterScroll.frame.width
        
        let postEnterView = UIView()
        postEnterView.frame = CGRect(x: 0, y: 0, width: Int(postEnterScrollWidth), height: 1400)
        self.postEnterScroll.addSubview(postEnterView)
        self.recipeTitleTextField.addSubview(postEnterView)
        self.cookTimeTextField.addSubview(postEnterView)
        self.sortChoosePicker.addSubview(postEnterView)
        self.recipeImageView.addSubview(postEnterView)
        self.materialsTableView.addSubview(postEnterView)
        self.chooseImageButton.addSubview(postEnterView)
        self.addMaterialButton.addSubview(postEnterView)
        
        
        let myrecipeView_width = postEnterView.frame.width
        
        return postEnterView
    }
    
    func configureSV() {
        // scrollViewにcontentsViewを配置させる
        let subView = self.createContentsView()
        self.postEnterScroll.addSubview(subView)
        
        // Tell scrollView the size of the contentsView
        self.postEnterScroll.contentSize = subView.frame.size
    }
    
    //材料に関係あるところ🌽🍅
    // セルの数は配列の数とする
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellArray.count
    }
    
    //材料に関係あるところ🌽🍅
    // セルの内容は配列の中身を使う
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cellArray.object(at: indexPath.row) as! UITableViewCell
    }
    
    // 配列の高さはxibファイルで設定したのViewの高さとする
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    @IBAction func tappedChooseImage(_ sender: Any) {
        let generater = UINotificationFeedbackGenerator()
        generater.notificationOccurred(.success)
        showAlert()
    }
    
    //材料に関係あるところ🌽🍅
    @IBAction func tappedAddMaterialItems(_ sender: Any) {
        print("tappedAddItem")
        // 新たに追加するセルを配列に格納する
        let cell : UITableViewCell = MaterialTableViewCell.initFromNib()
        cell.textLabel!.text = "\(self.cellArray.count + 1).新しい項目"
        self.cellArray.add(cell)
        
        // テーブルビューをリロードする
        self.materialsTableView.reloadData()
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //📷
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
    //📷
    func doAlbum() {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        //Check if the album is available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    //📷
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] as? UIImage != nil {
            let selectedImage = info[.originalImage] as! UIImage
            self.recipeImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    //📷
    //alert
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
 
    //Close the keyboard when the screen is touched
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        textField.resignFirstResponder()
//    }
}
