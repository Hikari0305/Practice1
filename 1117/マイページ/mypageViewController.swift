//
//  Change the profilephoto ViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/15.
//

import UIKit
import Firebase
import FirebaseAuth
import Nuke

class mypageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var changeAccountPhotoButton: UIButton!
    @IBOutlet weak var changeAccountNameButton: UIButton!
    
    private var users = [User]()
    
    @IBAction func tappedLogoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            statusToSignUp = true
           
            let storyboard = self.storyboard
            
            let rootVC = UIApplication.shared.windows.first?.rootViewController as? UITabBarController
            let navigationController = rootVC?.children[0] as? UINavigationController
            rootVC?.selectedIndex = 0
            
            navigationController?.popViewController(animated: true)
            
//            self.present(nav, animated: true, completion: nil)
        } catch {
            print("ログアウトに失敗しました")
        }
    }
    
    @IBAction func tappedChangePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setAccountNameButton(_ sender: Any) {
        self.accountLabel.text = accountTextField.text
        // キーボードを閉じる
        self.accountTextField.endEditing(true)
        self.accountTextField.text = ""
        self.changeAccountNameButton.isHidden = true
    }
    private var array = ["Favorites", "Browsed Recipe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スクロールできなくする
        self.mypageTableView.isScrollEnabled = false
        //何もないセルの区切り線をなくす
        self.mypageTableView.tableFooterView = UIView()
        self.changeAccountNameButton.isHidden = true
        self.accountTextField.delegate = self
        
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.layer.cornerRadius = 80
        print(self.profileImageView.layer.cornerRadius)
        
        fetchLoginUserInfo()
//        self.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmLoggedInUser()
        
    }
    
    private var user: User? {
        didSet {
            if accountLabel != nil && changeAccountPhotoButton != nil {
                accountLabel.text = user?.username
                changeAccountPhotoButton.setBackgroundImage(UIImage(named: user!.profileImageImageUrl), for: .normal)
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    @IBOutlet weak var mypageTableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.mypageTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = self.array[indexPath.row]
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = self.storyboard!
        if indexPath.row == 0 {
            
            let favoriteView = storyboard.instantiateViewController(withIdentifier: "favorites")
            self.navigationController?.pushViewController(favoriteView, animated: true)
            
        } else if indexPath.row == 1 {
            let browsedView = storyboard.instantiateViewController(withIdentifier: "browsed")
            self.navigationController?.pushViewController(browsedView, animated: true)
            
        } else {
        }
    }
    private func fetchLoginUserInfo() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        print(Firestore.firestore().collection("users").document(uid))
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                print("ユーザー情報の取得に失敗しました\(err)")
                return
            }
            guard let snapshot = snapshot, let dic = snapshot.data() else { return }
            
            let user = User(dic:dic)
            self.user = user
        }
    }
    private func confirmLoggedInUser() {
        if Auth.auth().currentUser?.uid != nil {
            fetchLoginUserInfo()
        }
    }
    var requestToMain = false
    
    func getRequestStatus() -> Bool {
        return requestToMain
    }
    
    func setRequestStatus(_ status: Bool) {
        requestToMain = status
    }
}

extension mypageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedmage = info[.editedImage] as? UIImage {
            self.profileImageView.image = editedmage
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.profileImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension mypageViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //マイページ、プロフィール、アカウント名の変更
        if self.accountTextField.text?.isEmpty ?? false {
            self.changeAccountNameButton.isHidden = true
        } else {
            self.changeAccountNameButton.isHidden = false
        }
    }
}




