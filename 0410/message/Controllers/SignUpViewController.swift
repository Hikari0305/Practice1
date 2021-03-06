//
//  SignUpViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/04/01.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImageButton.addTarget(self, action: #selector(tappedProfileImageButton), for: .touchUpInside)
        self.registerButton.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
        self.registerButton.isEnabled = false
        self.registerButton.backgroundColor = .rgb(red: 100, green: 100, blue: 100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        self.emailTextField.resignFirstResponder()
        self.emailTextField.text = textField.text
        self.passwordTextField.resignFirstResponder()
        self.passwordTextField.text = textField.text
        self.usernameTextField.resignFirstResponder()
        self.usernameTextField.text = textField.text
        return true
    }
    
    @objc private func tappedProfileImageButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func tappedRegisterButton() {
        guard let image = profileImageButton.imageView?.image else { return }
        guard let uploadImage = image.jpegData(compressionQuality: 0.3) else { return }
        
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("profile_image").child(fileName)
        
        storageRef.putData(uploadImage, metadata: nil) { (metaData, err) in
            if let err = err {
                print("Firestorageへの情報の保存に失敗しました。\(err)")
                return
            }
            storageRef.downloadURL { (url, err) in
                if let err = err {
                    print("FIlterstorageからのダウンロードに失敗しました。\(err)")
                    return
                }
                guard let urlString = url?.absoluteString else { return }
                print("urlString: ", urlString)
                self.createUserToFirestore(profileImageUrl: urlString)
            }
        }
    }
    @objc private func createUserToFirestore(profileImageUrl: String) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            if let err = err {
                self.statusLabel.text = "Authentication registration failed."
                print("認証情報の保存に失敗しました。 \(err)")
                return
            }
            
            guard let uid = res?.user.uid else { return }
            guard let username = self.usernameTextField.text else { return }
            let docData = [
                "email": email,
                "username": username,
                "createdAt": Timestamp(),
                "profileImageUrl": profileImageUrl
            ] as [String: Any]
            
            Firestore.firestore().collection("users").document(uid).setData(docData) {
                (err) in
                if let err = err {
                    print("データベースへの保存に成功しました。\(err)")
                }
            }
            print("Firestoreへの情報の保存に成功しました。")
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? false
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? false
        let usernameIsEmpty = usernameTextField.text?.isEmpty ?? false
        
        if emailIsEmpty || passwordIsEmpty || usernameIsEmpty {
            self.registerButton.isEnabled = false
            self.registerButton.backgroundColor = .rgb(red: 100, green: 100, blue: 100)
        } else {
            self.registerButton.isEnabled = true
            self.registerButton.backgroundColor = .rgb(red: 254, green: 126, blue: 131)
        }
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editimage = info[.editedImage] as? UIImage {
            self.profileImageButton.setImage(editimage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.profileImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        self.profileImageButton.setTitle("", for: .normal)
        self.profileImageButton.imageView?.contentMode = .scaleAspectFill
        self.profileImageButton.contentHorizontalAlignment = .fill
        self.profileImageButton.contentVerticalAlignment = .fill
        self.profileImageButton.clipsToBounds = true
        
        dismiss(animated: true, completion: nil)
    }
    
}
