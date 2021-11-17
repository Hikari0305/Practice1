//
//  MainChooseViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/18.
//

import UIKit

//Get screen size
let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

class MainChooseViewController: UIViewController {
    
    @IBOutlet weak var chooseImage1: UIImageView!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var chooseImage2: UIImageView!
    @IBOutlet weak var chooseLabel2: UILabel!
    @IBOutlet weak var chooseImage3: UIImageView!
    @IBOutlet weak var chooseLabel3: UILabel!
    @IBOutlet weak var chooseImage4: UIImageView!
    @IBOutlet weak var chooseLabel4: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var soupView: UIView!
    @IBOutlet weak var pageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var setMenuButton: UIButton!
    
    var viewWidth: CGFloat = 0
    var selectedDate: String = ""
    
    var recipeType: RecipeType = .None
    
    //This is the event function called when the next button
    @IBAction func onButtonTapped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage + 1
        updateContents(nextPage)
    }
    //This is the function that will be called when the backButton is pressed
    @IBAction func backButtonTaped(_ sender: Any) {
        let currentPage: Int = pageControl.currentPage
        let nextPage = currentPage - 1
        updateContents(nextPage)
    }
    
    func setRecipeType(_ type: RecipeType) {
        self.recipeType = type
    }
    
    func setDate(_ selectedDate: String){
        self.selectedDate = selectedDate
    }
    
    func updateContents(_ targetPageNum: Int) {
        let contentSize: CGSize = self.pageScrollView.contentSize
        pageScrollView.setContentOffset(CGPoint(x: floor(contentSize.width/3 * CGFloat(targetPageNum)), y: 0), animated: true)
        if targetPageNum == 0 {
            backButton.isHidden = true
            nextButton.isHidden = false
            setMenuButton.isHidden = true
        } else if targetPageNum == 1 {
            backButton.isHidden = false
            nextButton.isHidden = false
            setMenuButton.isHidden = true
        } else if targetPageNum == 2 {
            backButton.isHidden = false
            nextButton.isHidden = true
            setMenuButton.isHidden = false
        } else {
            //do nothing
        }
    }
    
    //I plan to get it↓ from the model later
    //This is the main dish
    var recipeList = ["Carbonara", "omelette rice", "Yellowtail teriyaki","cream stew with chicken", "scallop cooked rice", "curry rice"]
    var imageList = ["3ac4720cd39fcb7bc418a360734f4769f593c4e0.jpg", "26fb8d743b3e3e7645a4a947f4db74cb.jpg.webp", "i=https%3A%2F%2Fimage.excite.co.jp%2Fjp%2Ferecipe%2Frecipe%2F0%2F0%2F0075f14723f0ca3a9bcf5062871299b4%2F8e6ae4fb7223467b78bfd88ab8559dc0.jpeg&small=400&quality=100&type=jpeg.jpeg","IMG_0830.jpg","recipe.jpg",  "IMG_21642D891D85-1.jpeg"]
    var recipeIDList = ["15", "15", "15", "15", "15", "15"]
    var tappedList = [false, false, false, false, false, false]

    //This is the side dish
    var recipeList2 = ["potato salad", "takenoko", "kinnpira gobo", "Mizuna and tsuna salad", "ohitasi of nanohana", "avocado salad"]
    var imageList2 = ["PotatoSalad.jpg", "Takenoko.jpg", "KinpiraGobo.jpg", "IMG_2256.JPG","Nanohana.jpg" ,"AvocadoSalad.jpg"]
    var recipeIDList2 = ["26", "26", "26", "26", "26", "26"]
    var tappedList2 = [false, false, false, false, false, false]

    //This is the soup
    var recipeList3 = ["soup of eggplants, carrots and simeji", "wakame soup", "sweet potato soup", "cream soup", "minestrone", "chinese soup of bamboo shoots and cabbage"]
    var imageList3 = ["EggplantSoup.jpg", "Soup.jpg", "SweetPotatoSoup.jpg","CreamSoup.jpg", "Minestrone.jpg", "ワンタン.jpg"]
    var recipeIDList3 = ["2", "2", "2", "2", "2",
                         "2"]
    var tappedList3 = [false, false, false, false, false, false]
    
    struct recipeData {
        var name = ""
        var imagePath = ""
        var tapped = false
        
    }
    //This is a collection view for main cooking
    private let collectionView: UICollectionView = {
        
        //Cell layout design
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //Cell registration
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    //This is a collection view for side
    private let sideCollectionView: UICollectionView = {
        
        //Cell layout design
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //Cell registration
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    //This is a collection view for soup
    private let soupCollectionView: UICollectionView = {
        
        //Cell layout design
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 100, width: screenSize.width - 40, height: screenSize.height/2 + 50 ), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //Cell registration
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageScrollView.delegate = self
        
        self.collectionView.tag = 0
        self.sideCollectionView.tag = 1
        self.soupCollectionView.tag = 2
        //生成したcollectionViewのdataSourceとdelegteを紐づける
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.sideCollectionView.delegate = self
        self.sideCollectionView.dataSource = self
        self.soupCollectionView.delegate = self
        self.soupCollectionView.dataSource = self
        
        view.addSubview(self.collectionView)
        view.addSubview(self.sideCollectionView)
        view.addSubview(self.soupCollectionView)
        self.mainView.addSubview(self.collectionView)
        self.sideView.addSubview(self.sideCollectionView)
        self.soupView.addSubview(self.soupCollectionView)
        
        self.backButton.isHidden = true
        self.setMenuButton.isHidden = true
        
        self.viewWidth = self.pageScrollView.frame.width
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationItem.title = self.selectedDate
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
    @IBAction func setMenu(_ sender: Any) {
        print("SetMenu will start from now")
        var i = 0
        var idList = [String]()
        
        for item in tappedList {
            if item == true {
                let recipe = recipeList[i]
                let path = imageList[i]
                let id = recipeIDList[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        print("------------------")
        i = 0
        for item in tappedList2 {
            if item == true {
                let recipe = recipeList2[i]
                let path = imageList2[i]
                let id = recipeIDList2[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        print("------------------")
        i = 0
        for item in tappedList3 {
            if item == true {
                let recipe = recipeList3[i]
                let path = imageList3[i]
                let id = recipeIDList3[i]
                idList.append(id)
                print(recipe + "," + path + "," + id)
            }
            i += 1
        }
        commonDictionary[selectedDate] = ["id": idList]
        print(selectedDate)
        print(commonDictionary)
    }
}
//Setting information to give to cell
extension MainChooseViewController: UICollectionViewDataSource {
    
    
    //Setting the number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch recipeType {
//        case .Main:
//            return mainRecipeIdList.count
//        case .Side:
//            return sideRecipeIdList.count
//        case .Soup:
//            return soupRecipeIdList.count
//        default:
//            break
//        }
//        return 0
        switch recipeType {
        case .Main:
            return recipeList.count
        case .Side:
            return recipeList2.count
        case .Soup:
            return recipeList3.count
        default:
            break
        }
        return recipeList.count
    }
    
    func getRecipeId(_ recipeType: RecipeType, _ index: Int) -> String {
        switch recipeType {
        case .Main:
            if mainRecipeIdList.count > index {
                return mainRecipeIdList[index]
            }
            break
        case .Side:
            if sideRecipeIdList.count > index {
                return sideRecipeIdList[index]
            }
            break
        case .Soup:
            if soupRecipeIdList.count > index {
                return soupRecipeIdList[index]
            }
            break
        default:
            return ""
        }
        return ""
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
//            let recipeId: String = getRecipeId(self.recipeType, indexPath.row)
//
//            let targetRecipe = commonRecipeList[recipeId]
//            if targetRecipe != nil {
//                let recipename = targetRecipe![keyName]! as! String
//                let recipeimage = targetRecipe![keyPath]! as! String
//                cell.setupContents(textName: recipename, imagepath: recipeimage)
//                return cell
//            }
//        }
//        return CollectionViewCell()
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        var imagepath = ""
        var cellText = ""
        print("called collectionView")
        print(collectionView.tag)
        switch collectionView.tag {
        case 0:
            imagepath = self.imageList[indexPath.item]
            cellText = self.recipeList[indexPath.item]
            break
        case 1:
            imagepath = self.imageList2[indexPath.item]
            cellText = self.recipeList2[indexPath.item]
            break
        case 2:
            imagepath = self.imageList3[indexPath.item]
            cellText = self.recipeList3[indexPath.item]
            break
        default: break

        }

        cell.self.setupContents(textName: cellText, imagepath: imagepath)
        if (tappedList[indexPath.item] == true) {
            cell.setFilter()
            cell.updateCheckStatus(true)
        }
        return cell
    }
    
}

//Event settings
extension MainChooseViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            if tappedList[indexPath.item] {
                tappedList[indexPath.item] = false
            } else {
                tappedList[indexPath.item] = true
                
            }
            break
        case 1:
            if tappedList2[indexPath.item] {
                tappedList2[indexPath.item] = false
            } else {
                tappedList2[indexPath.item] = true
            }
            break
        case 2:
            if tappedList3[indexPath.item] {
                tappedList3[indexPath.item] = false
            } else {
                tappedList3[indexPath.item] = true
            }
            break
        default: break
                
        }
        
        //        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        //        cell.onTapped()
        
        collectionView.reloadItems(at: [indexPath])
    }
}

//Cell size setting
extension MainChooseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (screenSize.width-50) / 2, height: (screenSize.width+50)/2)
    }
    
}
extension MainChooseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        let pageControlNumber = pageScrollView.contentOffset.x / pageScrollView.frame.size.width
        if pageControlNumber.truncatingRemainder(dividingBy: 1) == 0 {
            pageControl.currentPage = Int(pageControlNumber)
        }
    }
}
