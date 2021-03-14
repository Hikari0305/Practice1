//
//  chatViewController1.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/02.
//

import UIKit

//ホーム、メッセージ、個人それぞれのページ
class chatViewController1: UIViewController {
    var text = ""
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = text

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
