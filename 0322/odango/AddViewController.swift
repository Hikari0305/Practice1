//
//  AddViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/02/27.
//

import UIKit

//メッセージの設定、友達を追加
var member = [String]()

class AddViewController: UIViewController {

    @IBOutlet weak var memberTextField: UITextField!
    
    @IBAction func memberAddButton(_ sender: Any) {
        member.append(memberTextField.text!)
        memberTextField.text = ""
        UserDefaults.standard.set(member, forKey: "memberList")
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
