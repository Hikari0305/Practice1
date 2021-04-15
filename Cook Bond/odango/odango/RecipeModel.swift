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
var keyPID = "prepareID"
//ここのdictionaryは.jsonから読み込む予定です。

let commonRecipeList = ["15": ["common_imagePath": "IMG_0830.jpg",
                        "sort": "Main",
                        "common_name": "Cream stew with chicken",
                        "common_time": "45minutes",
                        "common_calorie": "411kcal",
                        "common_ingredients": [
                           [
                               "name": "Chicken thigh",
                               "quantity": "1 sheet"
                               
                           ],
                           [
                               "name": "Sugar",
                               "quantity": "1/2 teaspoon"

                           ],
                           [
                               "name": "Potatoes",
                               "quantity":"2 pieces"
                               
                           ],
                           [
                               "name": "onion",
                               "quantity": "1 piece"
                           ],
                           [
                               "name": "Carrots",
                               "quantity": "One"
                           ],
                           [
                               "name": "broccoli",
                               "quantity": "1/2 piece (150g)"
                           ],
                           [
                               "name": "Cake flour",
                               "quantity": "3 tablespoon"
                           ],
                           [
                               "name": "milk",
                               "quantity": "2 1/2 cup"
                           ],
                           [
                               "name": "water",
                               "quantity": "2 cups"
                           ],
                           [
                               "name": "Consomme solid type",
                               "quantity": "1 piece"
                           ],
                           [
                               "name": "Bay leaf",
                               "quantity": "1 sheet"
                           ],
                           [
                               "name": "solt",
                               "quantity": "1 tablespoons"
                           ],
                           [
                               "name": "Pepper",
                               "quantity": "a little"
                           ],
                           [
                               "name": "White wine",
                               "quantity": "1 tablespoon"
                           ],
                           [
                               "name": "butter",
                               "quantity": "2 tablespoons"
                           ],
                           [
                               "name": "salad oil",
                               "quantity": "1 tablespoon"
                           ],
                           
                        ],
                        "recipe": [
                           [
                               "order": 1,
                               "detail": "Cut the potatoes into 4 equal parts (random cutting).",
                               "prepareID": 1
                           ],
                           [
                               "order": 2,
                               "detail": "Cut the onions into combs (random cutting).",
                               "prepareID": 1
                           ],
                           [
                               "order": 3,
                               "detail": "Cut the carrots into small pieces (random cutting).",
                               "prepareID": 1
                           ],
                           [
                               "order": 4,
                               "detail": "Divide the broccoli into small bunches (random cutting).",
                               "prepareID": 1
                           ],
                           [
                               "order": 5,
                               "detail": "Boil broccoli down."],
                           [
                               "order": 6,
                               "detail": "Cut chicken into bite-sized pieces, and season with salt."],
                           [
                               "order": 7,
                               "detail": "Lightly roast cutted chicken in a frying pan, and remove."],
                           [
                               "order": 8,
                               "detail": "In a pan, heat 1 tablespoon butter and oil over medium heat, add the onions from (1)~(7) and fry quickly. Add the potatoes from (1)~(7) and fry, add the carrots from (1)~(7), and fry until the oil is all over."
                           ],
                           [
                               "order": 9,
                               "detail": "Turn off the heat, sprinkle in the flour, mix the whole, and fry over medium heat. Add milk, water, consomme and bay leaf and bring to a boil."
                           ],
                           [
                               "order": 10,
                               "detail": "Boil the potatoes until they are cooked for 15 to 20 minutes, stirring them halfway so that the bottom does not burn."
                           ],
                           [
                               "order": 11,
                               "detail": "Put the chicken back in (1)~(7), add salt and pepper, simmer for 5 minutes, and add broccoli, white wine, and 1 tablespoon butter from (1)~(7) to adjust the taste."
                           ]
                        ]],
                        "2": [
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
                                "detail": "Cut pork"
                            ],
                            [
                                "order": 2,
                                "detail": "Cut carrots"],
                            [
                                "order": 3,
                                "detail": "Cut potaotes"],
                            [
                                "order": 4,
                                "detail": "Heat the oil in a pan, at Chopped Onion and hopped garlic and fry over low heat until tender. Add the amount of water and the pork, carrots and potatos from 1 to medium heat. After boiling, reduce the heat to low and simmer until the vegetables are cooked."
                            ],
                            [
                                "order": 5,
                                "detail": "Turn off the heat, at the curry roux and when the roux melts, put it on low heat again, add oyster sause and simmer for another four to five minutes."
                            ],
                            [
                                "order": 6,
                                "detail": "Place rice on a plate and sprinkle 3"
                            ]
                            
                         ]
                        ],
                        "26":[
                        "common_imagePath": "IMG_2256.JPG",
                         "sort": "Side",
                         "common_name": "Mizuna and tuna salad",
                         "common_time": "3minutes",
                         "common_calorie": "119kcal",
                         "common_ingredients": [
                            [
                                "name": "Mizuna",
                                "quantity": "4 shares"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "Tuna (can)",
                                "quantity": "160g"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "Purple onion",
                                "quantity":"1/4"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "lemon juice",
                                "quantity": "1/2 piece"
//                                "seasoning": false
                            ],
                            [
                                "name": "salt",
                                "quantity": "a little"
//                                "seasoning": true
                            ],
                            [
                                "name": "Coarse black pepper",
                                "quantity": "appropriate amount"
//                                "seasoning": false
                            ]
                        ],
                        "recipe": [
                            [
                                "order": 1,
                                "detail": "Cut off the root of Mizuna and cut it into 3 cm long pieces. Tuna drains oil."
                            ],
                            [
                                "order": 2,
                                "detail": "Slice the purple onion along the fiber and quickly expose it to water to drain it."
                            ],
                            [
                                "order": 3,
                                "detail": "Put all ingredients in a bowl, mix well and serve in a bowl."
                            ]
                           
                            ]
                        ]]


var commonDictionary = [
    "2021/03/23(Tue)": ["id": ["15","26"]],
    "2021/03/24(Wed)": ["id": ["2"]]
]

struct recipeStatus {
    var shoppingList = [Bool]();
    var preparingList = [Bool]();
    var cookingList = [Bool]();
}

var recipeStatusList = ["15": recipeStatus ( shoppingList:[Bool](repeating: false, count: 16),
                                             preparingList: [Bool](repeating: false, count: 4),
                                             cookingList:[Bool](repeating: false, count: 7) )
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

let prepareTableInfo = [
    ["id": 1,
     "name": "Random cutting",
     "movie": "IMG_2237.JPG",
     "detail": "Random cutting is a method of cutting a long and narrow material with end a rounded end that the size is aligned diagonally while turning."
    ],
    ["id": 2,
     "name": "half-moons cut",
     "detail": "Random cutting is a method of cutting a long and narrow material with end a rounded end that the size is aligned diagonally while turning."]
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
