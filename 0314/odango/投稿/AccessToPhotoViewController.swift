//
//  AccessToPhotoViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/14.
//

import UIKit

//投稿　カメラと写真への起動
class AccessToPhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var displayImageToPost: UIImageView!
    @IBOutlet weak var selectPhotoToPostButton: UIButton!
    
    func useCamera(isDeletable: Bool?=nil,
                              deleteAction:((UIAlertAction) -> Void)?=nil) {
          /*checkCameraAuth {
                DispatchQueue.main.async { [weak self] in
                    guard let this = self else { return }
                    this.activeCamera(isDeletable: isDeletable,
                                          deleteAction: deleteAction)
                }
            }*/
    }
    func activeCamera(isDeletable: Bool?=nil,
                                 deleteAction:((UIAlertAction) -> Void)?=nil) {
        let alert: UIAlertController = UIAlertController(title: "", message: "選択してください", preferredStyle: .actionSheet)
        let cameraAction: UIAlertAction = UIAlertAction(title: "カメラで撮影", style: .default, handler:{ [weak self]
                (action: UIAlertAction!) -> Void in
            guard let this = self else { return }
            let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = this
                this.present(cameraPicker, animated: true, completion: nil)
            }
        })

        let galleryAction: UIAlertAction = UIAlertAction(title: "アルバムから選択", style: .default, handler:{ [weak self]
            (action: UIAlertAction!) -> Void in
            guard let this = self else { return }
            let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                let libraryPicker = UIImagePickerController()
                libraryPicker.sourceType = sourceType
                libraryPicker.delegate = this
                this.present(libraryPicker, animated: true, completion: nil)
            }
        })

        let deleteAction = UIAlertAction(title: "写真を削除", style: .default, handler: deleteAction)
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("キャンセル")
        })
        alert.addAction(cancelAction)
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        if isDeletable == true {
            alert.addAction(deleteAction)
        }
        present(alert, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.displayImageToPost.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
