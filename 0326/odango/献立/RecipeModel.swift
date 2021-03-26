//
//  RecipeModel.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/24.
//

import UIKit

var key_2021323 = "2021/03/23(Tue)"
var key_name = "common_name"
var key_path = "common_imagePath"
var key_time = "common_time"
var key_calorie = "common_calorie"
var key_ingList = "common_ingredients"
var key_ingname = "name"
var key_ingq = "quantity"
//ここのdictionaryは.jsonから読み込む予定です。
let common_dictionary = [
    "2021/03/23(Tue)": ["common_name": "soba",
                        "common_imagePath": "unnamed.jpg",
                        "common_time": "20 minutes",
                        "common_calorie": "200 calorie",
                        "common_ingredients": [["name": "water",
                                               "quanitity": "500cc"],
                                               ["name": "soba",
                                                "quantity": "2 or 3 bundle"],
                                               ["name":"mentsuyu",
                                                "quantity":"150cc"]]
                        ],
    "2021/03/24(Wed)": ["common_name": "curry rice",
                        "common_imagePath": "unnamed.jpg",
                        "common_time": "30 minutes",
                        "common_calorie": "746kcal",
                        "common_ingredients": [["name": "pork and lump",
                                               "quanitity": "500cc"],
                                               ["name": "soba",
                                                "quantity": "2 or 3 bundle"],
                                               ["name":"mentsuyu",
                                                "quantity":"150cc"]],
                        "recipe": [
                            [
                                "order": 1,
                                "detail": "Cut pork, carrotsand potatoes into bite-sized pieces."
                            ],
                            [
                                "order": 2,
                                "detail": "Heat the oil in a pan, at Chopped Onion and hopped garlic and fry over low heat until tender. Add the amount of water and the pork, carrots and potatos from 1 to medium heat. After boiling, reduce the heat to low and simmer until the vegetables are cooked."
                            ],
                            [
                                "order": 3,
                                "detail": "Turn off the heat, at the curry roux and when the roux melts, put it on low heat again, add oyster sause and simmer for another four to five minutes."
                            ],
                            [
                                "order": 4,
                                "detail": "Place rice on a plate and sprinkle 3"
                            ]

                        ]
    ]
]

//これはmodelのクラスです。ほかのviewクラスでコピペになっているところをまとめます。
class RecipeModel: UIView {

    let dictionary = ["2021/03/23(Tue)": ["name": "soba", "imagePath": "unnamed.jpg", "time": "20 minutes", "calorie": "200 calorie", "ingredients": ["water", "rice"]]]
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
