//
//  CollectionViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/01.
//

import UIKit

/*class CollectionViewController: UIViewController {
    
    
     
    @IBOutlet weak var collectionView: UICollectionView! {
    
        didSet{
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    private let reuseIdentifier = "collectionViewCell"
    private var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        for _ in 0 ..< 20 {
                    let randomColor = UIColor.init(
                        red: CGFloat(arc4random_uniform(255)) / 255,
                        green: CGFloat(arc4random_uniform(255)) / 255,
                        blue: CGFloat(arc4random_uniform(255)) / 255,
                        alpha: 1
                    )
                    colors.append(randomColor)
                }
    }
    
    
    @IBOutlet private weak var collectionViewConstraintHeight: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Do any additional setup after loading the view.
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewConstraintHeight.constant = layout.collectionViewContentSize.height
            view.layoutIfNeeded()
            view.frame.size.height = layout.collectionViewContentSize.height
        }
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
// MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.row]
        return cell
    }
} */
