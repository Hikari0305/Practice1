//
//  MainViewController.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/01.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildren()

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
    
    private func setupChildren() {
           // CollectionViewController
           let collectionViewController = CollectionViewController()
           addChild(collectionViewController)
           stackView.addArrangedSubview(collectionViewController.view)
           collectionViewController.didMove(toParent: self)

           // TableViewController
           let tableViewController = TableViewController()
           addChild(tableViewController)
           stackView.addArrangedSubview(tableViewController.view)
           tableViewController.didMove(toParent: self)
       }

}
