//
//  ViewController.swift
//  Sunrise App
//
//  Created by 吉田光 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameInput: UITextField!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func findSunrise(_ sender: Any) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityNameInput.text!)&appid=99e406c3852b9a8273bf5aca47f374bb"
        getURL(url:url)
    }
    
    func getURL(url:String){
        do {
         let apiURL = URL(string:url)!
         let data = try Data(contentsOf:apiURL)
         let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
        //print(json)
            let query = json ["query"] as! [String:Any]
            let temp = json ["query"]
            let results = query["results"] as! [String:Any]
            let channel = results["channel"] as! [String:Any]
            let astronomy = channel["astronomy"] as! [String:Any]
            
            self.sunriseTimeLabel.text = "日の出時刻: \(astronomy["sunrise"]!)"
        }catch{
            self.sunriseTimeLabel.text = "サーバーに接続できません"
        }
}

}

