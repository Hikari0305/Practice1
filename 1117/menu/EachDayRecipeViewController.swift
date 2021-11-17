//
//  EachDayRecipeViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/17.
//

import UIKit

class EachDayRecipeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var eachdayView: UIView!
    @IBOutlet weak var day: UILabel!
    
    struct viewData {
        var name: String = ""
        var imagePath: String = ""
        var id: String = ""
        
    }
    var viewDataList = [viewData]()
    
    var val = commonDictionary[key2021323]

    var selectedDate: String = "date"
        
    var tappedList = [false, false, false, false, false, false]
    
    func buttonAspectFill(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin = 15
        let day_width = self.eachdayView.frame.width - 30
        self.day.font = self.day.font.withSize(40)
        let day_height = 40
        self.day.frame = CGRect(x: margin, y: 110, width: Int(day_width), height: day_height)
        
        self.day.text = self.selectedDate
        
        //Associate the generated collectionView dataSource and delegate
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        view.addSubview(self.collectionView)
        self.eachdayView.addSubview(self.collectionView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationItem.title = ""
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private let collectionView: UICollectionView = {

        //Cell layout design
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView( frame: CGRect(x: 20, y: 175, width: 372, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //Cell registration
        collectionView.register(EachDayCollectionCell.self, forCellWithReuseIdentifier: "Cell_test")
        return collectionView
    }()

    func updateString (_ selectedDate: String) {
        self.selectedDate = selectedDate
        print(selectedDate)

        let recipeData = commonDictionary[selectedDate]
        if (recipeData != nil) {
            let idList = recipeData!["id"]
            //idからrecipe情報を取得する
            for id in idList! {
                let recipe = commonRecipeList[id]
                //recipe情報から料理名とimagepathを取得して、viewDataのオブジェクトを生成する
                if recipe != nil {
                    let name = recipe![keyName] as! String
                    let path = recipe![keyPath] as! String
                    let data = viewData(name: name, imagePath: path, id: id)
                    //viewDataのObjectをself.viewDataList.append()で追加する
                    self.viewDataList.append(data)
                }
                
            }
        }

    }
    
    func showDetail(recipeID: String) {
        let storyborad: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //②Get an instance of the transition destination view controller
        let nextView = storyborad.instantiateViewController(withIdentifier: "recipeDetail")as! RecipeDetailViewController
        //③screen transition
        self.navigationController?.pushViewController(nextView, animated: true)

        //決め打ちです
        nextView.self.updateDataWithID(recipeID)
    }

    //cell number
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewDataList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_test", for: indexPath) as! EachDayCollectionCell

        let imagepath = viewDataList[indexPath.item].imagePath
        let cellText = viewDataList[indexPath.item].name

        cell.self.setupContents(textName: cellText, imagepath: imagepath)

        return cell
    }

    //This function is called when cell is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if tappedList[indexPath.item] {
            tappedList[indexPath.item] = false
        } else {
            tappedList[indexPath.item] = true
        }

        collectionView.reloadItems(at: [indexPath])
        showDetail(recipeID: viewDataList[indexPath.item].id)
    }

    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        print("width: ", (screenSize.width-50) / 2)
        return CGSize(width: (screenSize.width-50) / 2, height: (screenSize.width+50)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                     willDisplay cell: UICollectionViewCell,
                       forItemAt indexPath: IndexPath){
      print("willDisplay")
    }
}
