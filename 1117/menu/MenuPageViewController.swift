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
    @IBOutlet weak var shopListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set delegate
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        self.shopListButton.setImage(UIImage(named: "IMG_2224.jpg"), for: .normal)
        self.shopListButton.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        self.shopListButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let imageView = self.shopListButton.subviews.compactMap({$0 as? UIImageView}).first {
            imageView.contentMode = .scaleAspectFit //<-
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //↓This function detects when a calendar day is tapped
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //Specify the display format with formatter
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd(EEE)"
        //date -> string
        let selectedDate = formatter.string(from: date)
        print(selectedDate)
        
        //Screen transition
        //①Get an instance of storyboard
        let storyborad: UIStoryboard = self.storyboard!
                
        let value2 = commonDictionary[selectedDate]
        
        print("test_dictionary\(String(describing: value2))")
        
        if value2 == nil {
            //②Get an instance of the transition destination view controller
            let nextView = storyborad.instantiateViewController(withIdentifier: "createmenupage")as! MainChooseViewController
            //③screen transition
            self.navigationController?.pushViewController(nextView, animated: true)
            nextView.setDate(selectedDate)
        } else {
            //②Get an instance of the transition destination view controller
            let nextView = storyborad.instantiateViewController(withIdentifier: "view2")as! EachDayRecipeViewController
            //③screen transition
            self.navigationController?.pushViewController(nextView, animated: true)                                    
            nextView.updateString(selectedDate)
        }
        
        //getData()
        
    }
    
    // date -> Get date with Int
    func getDay(_ date:Date) -> (Int,Int,Int) {
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
}

