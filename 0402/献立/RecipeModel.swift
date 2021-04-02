//
//  RecipeModel.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/24.
//

import UIKit

var key2021323 = "2021/03/23(Tue)"
var keyID = "id"
var keyName = "common_name"
var keyPath = "common_imagePath"
var keyTime = "common_time"
var keyCalorie = "common_calorie"
var keyIngList = "common_ingredients"
var keyIngName = "name"
var keyIngQ = "quantity"
var keyHowto = "recipe"
var keyOrder = "order"
var keyDetail = "detail"
//ここのdictionaryは.jsonから読み込む予定です。
let commonDictionary = [
    "2021/03/23(Tue)": ["id": "1",
                        "common_name": "soba",
                        "common_imagePath": "unnamed.jpg",
                        "common_time": "20 minutes",
                        "common_calorie": "200 calorie",
                        "common_ingredients": [["name": "water",
                                               "quanitity": "500cc"],
                                               ["name": "soba",
                                                "quantity": "2 or 3 bundle"],
                                               ["name":"mentsuyu",
                                                "quantity":"150cc"]],
                        "recipe": [
                            [
                                "order": 1,
                                "detail": "Cut pork, carrots and potatoes into bite-sized pieces."
                                
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
                        ],
    "2021/03/24(Wed)": ["id": "2",
                        "common_name": "curry rice",
                        "common_imagePath": "4462576_s.jpg",
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

let recipeTableInfo = [
    ["id": "1",
    "common_name": "soba",
    "common_imagePath": "unnamed.jpg",
    "common_time": "20 minutes",
    "common_calorie": "200 calorie"],
    ["id": "2",
    "common_name": "curry rice",
    "common_imagePath": "QP10004840_1L.jpg",
    "common_time": "30 minutes",
    "common_calorie": "746kcal"],
    ["id": "3",
    "common_name": "Gyoza",
     "common_imagePath": "16303ea280c958d0ef4d6c3420809cc0.jpg",
    "common_time": "40minutes",
    "common_calorie": "239kcal"]
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
