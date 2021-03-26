//
//  messageSetting.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/06.
//

import UIKit

class messageSetting: UIViewController {

    var tableData:[String] = [
    "1.Apple",
    "2.Swift",
    "3.iPad",
    ]
   
    //ホーム、メッセージの設定、友達の削除
    @IBOutlet weak var messageSettingTable: UITableView!
    override func  viewDidLoad() {
        super.viewDidLoad()
        messageSettingTable.delegate = self
        messageSettingTable.allowsMultipleSelectionDuringEditing = true
        navigationItem.rightBarButtonItem = editButtonItem
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        messageSettingTable.isEditing = editing
        
        print(editing)
    }
    
    //ホーム、メッセージの通知
    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBAction func messageUISwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchStatusLabel.text = "ONです"
        } else {
            switchStatusLabel.text = "OFFです"
        }
    }//ここまで　ホーム、メッセージの通知
    
}//class messageSettingはここまで

extension messageSetting: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tableData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
}//ここまでホーム、メッセージの設定、友達の削除
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


