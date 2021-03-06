//
//  calendarViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/05.
//

import UIKit
import FSCalendar

/* https://qiita.com/Koutya/items/f5c7c12ab1458b6addcd */
class MenuPageViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲートの設定
        self.calendar.dataSource = self
        self.calendar.delegate = self
    
        //calendar.scope = .week
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    let dictionary = ["2021/03/23(Tue)": ["name": "soba", "imagePath": "unnamed.jpg", "time": "20 minutes", "calorie": "200 calorie", "ingredients": ["water", "rice"]]]
//    let value = dictionary["2021/03/23(Tue)"]
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    //↓この関数は、カレンダーの日がタップされたことを検知する関数
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //表示する形式をformatterで指定
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd(EEE)"
        //date型からstring型へ変換
        let selectedDate = formatter.string(from: date)
        print(selectedDate)
        
        //日付の選択解除
        /*for date in calendar.selectedDates {
                calendar.deselect(date)
            }*/
        
        //画面遷移
        //①storyboardのインスタンス取得
        let storyborad: UIStoryboard = self.storyboard!
        
//        print(dictionary["2021/03/23(Tue)"]!)
    
        let value2 = common_dictionary[selectedDate]
        
        print("test_dictionary\(String(describing: value2))")
        
        if value2 == nil {
            //②遷移先ViewControllerのインスタンス取得
            let nextView = storyborad.instantiateViewController(withIdentifier: "createmenupage")as! EachDayChooseViewController
            //③画面遷移
            self.navigationController?.pushViewController(nextView, animated: true)
            
            
        } else {
            //②遷移先ViewControllerのインスタンス取得
            let nextView = storyborad.instantiateViewController(withIdentifier: "view2")as! EachDayRecipeViewController
            //③画面遷移
            self.navigationController?.pushViewController(nextView, animated: true)
            
            let value2 = common_dictionary[selectedDate]
            
            let recipename = value2!["common_name"] as! String
            
            nextView.updateString(selectedDate)
            print("tests\(recipename)")
            
        }
    
        //getData()
        
        }
    
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int) {
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定(日曜日:1 ~ 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int {
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    //土日の文字色を変える
     /*func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }
        else if weekday == 7 {
            return UIColor.blue
        }
        
        return nil
        
    } */
    
    
}

