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
var keyPath = "image"
var keyTime = "time"
var keyCalorie = "calorie"
var keyIngList = "ingredients"
var keyIngName = "name"
var keyIngQ = "quantity"
var keyHowto = "recipe"
var keyOrder = "order"
var keyDetail = "detail"
var keyPID = "prepareID"
//ここのdictionaryは.jsonから読み込む予定です。

let commonRecipeList = ["1": ["image": "IMG_21642D891D85-1.jpeg",
                              "sort": "Main",
                              "common_name": "Curry rice(hidden with oyster sauce)",
                              "time": "30minutes",
                              "calorie": "746kcal",
                              "ingredients": [
                                [
                                    "name": "Pork and lump",
                                    "quantity": "300g"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "Carrot",
                                    "quantity": "1 bottle"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "Potato",
                                    "quantity": "2pieces"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "chopped Onion",
                                    "quantity": "2 pieces"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "hopped Garlic",
                                    "quantity": "1piece"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "3・1/2cup"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "curry roux",
                                    "quantity": "100g"
                                ],
                                [
                                    "name": "Oyster sauce",
                                    "quantity": "2 teaspoons"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "rice",
                                    "quantity": "800g"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "salad oil",
                                    "quantity": "2tablespoons"
                                    //                               "seasoning": true
                                ]
                              ],
                              "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut pork, carrotsand potatoes into bite-sized pieces(random cutting)",
                                    "prepareID": 1
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
                                
                                
                              ]],
                        "2": ["image": "IMG_21642D891D85-1.jpeg",
                              "sort": "Main",
                              "common_name": "Gyoza",
                              "time": "40minutes",
                              "calorie": "239kcal",
                              "ingredients": [
                                [
                                    "name": "Dumpling skins",
                                    "quantity": "25 sheets"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "Minced pork",
                                    "quantity": "125g"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "Cabbage",
                                    "quantity": "4 sheets(175g)"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "Chopped green onions",
                                    "quantity": "12cm(25g)"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "Grated ginger",
                                    "quantity": "1 teaspoon"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "grated garlic",
                                    "quantity": "1 teaspoon"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "oyster sauce",
                                    "quantity": "1 tablespoon"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Maru Chiken soup",
                                    "quantity": "2 teaspoons"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Salad oil",
                                    "quantity": "Appropriate amount"
                                    //                               "seasoning": true
                                ]
                              ],
                              "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Finely chop the cabbage, sprinkle with salt and squeeze the water when it became soft."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put minced meat, cabbage 1, green onions, Grated ginger, grated garlic, oyster sauce and Maru Chiken soup in a bowl and knead well until stickey to make ingredients."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Put the ingredients of 2 on the gyoza skin and wrap it in equzl parts."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Heat the oil in a frying pan, line up the dumping from 3 and bake them and add a brown color to the bottom. Add water(outside the amount) to half the height of the dumplings, cover and steam over medium to high heat for to 5minutes."
                                ],
                                [
                                    "order": 5,
                                    "detail": "When the water is alomost gone, remove the water and take it out to a place when it is crispy"
                                ]
                              ]
                        ],
                        
                        "4":[
                            "image": "IMG_0830.jpg",
                            "sort": "Side",
                            "common_name": "Meat and Potatoes",
                            "time": "30minutes",
                            "calorie": "371kcal",
                            "ingredients": [
                                [
                                    "name": "Beef chopped meat",
                                    "quantity": "150g"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "onion",
                                    "quantity": "1(200g)"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "Carrot",
                                    "quantity": "1(150g)"
                                    //                               "seasoning": false
                                    
                                ],
                                [
                                    "name": "potatoes",
                                    "quantity": "3(150g)"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "2 cups"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Sake",
                                    "quantity": "2 tablesppons"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Hon-Dashi",
                                    "quantity": "1 teaspoon"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Sugar",
                                    "quantity": "1 teaspoon"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Mirin",
                                    "quantity": "1 tablespoons"
                                    //                               "seasoning": true
                                ],
                                [
                                    "name": "Soy sauce",
                                    "quantity": "2 tablespoons"
                                    //                               "seasoning": true
                                ],
                                
                                [   "name": "Green beans(boiled)",
                                    "quantity": "Appropriate amount"
                                    //                               "seasoning": false
                                ],
                                [
                                    "name": "Salad oil",
                                    "quantity": "1 tablespoon"
                                    //                               "seasoning": true
                                ],
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the onions into 8 equal pieces and cut the carrots into 1.5cm wide gingo biloda. Cut the potatoes into 4 equal parts. Cut the potatoes into 3 cm lengths."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Heat the oil in a frying pan over medium heat, add the beef and fry. When the color of the meat changes, add the onions, carrots and potatoes in 1 in that order the and fly."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Add water and sake, remove the lye when boiling, cover and simmer on low heat for 10 minutes, add Hon-Dashi and Sugar and simmer for another 5 minutes. Add soy sauce and simmer for 5minutes. Add soy sauce and simmer for 5minutes without the lid. Boil the borth so that it returns from the bottom of the frying pan."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Serve in a bowl and sprinkle with the green beans from 1."
                                ]
                            ]
                        ],
                        "5":["image": "IMG_0830.jpg",
                             "sort": "Main dish",
                             "common_name": "Pork cutlet ",
                             "time": "25minutes",
                             "calorie": "559kcal",
                             "ingredients": [
                                [
                                    "name": "Pork loin pork cutlet meat ",
                                    "quantity": "4 sheets"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "egg",
                                    "quantity": "2 pieces"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "cabbage",
                                    "quantity": "6 sheets (300g)"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "Lemon / comb shape",
                                    "quantity": "1 piece"
                                    //                                    "seasoning": false
                                ],
                                [
                                    "name": "Umami seasoning ",
                                    "quantity": "a little"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "Solt",
                                    "quantity": "a little"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity": "a little"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "Cake flour Appropriate",
                                    "quantity": "amount"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "salad oil",
                                    "quantity": "Appropriate amount"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "Dried bread crumbs",
                                    "quantity": "Appropriate amount"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "Tonkatsu sauce",
                                    "quantity": "Appropriate amount"
                                    //                                    "seasoning": true
                                ]
                                
                             ],
                             "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the cabbage in half vertically, stack it, and cut it into small pieces."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Cut the carrots into thin slices vertically, stack several pieces, and cut into small pieces.Put in a bowl of water with cabbage. After about 5 minutes, raise it in a colander and drain it."
                                ],
                                [
                                    "order": 3,
                                    "detail": "For pork, make 4 to 5 cuts at the boundary between lean meat and fat with the edge of a kitchen knife and cut the streaks."
                                ],
                                [
                                    "order": 4,
                                    "detail":"Salt and pepper on both sides (when  is used as a base,the characteristic of the meat stands out)"
                                ],
                                [
                                    "order": 5,
                                    "detail":"Melt the egg in a vat. Sprinkle a thin layer of cake flour on the pork and sprinkle it on it.Beat off excess cake flour."
                                ],
                                [
                                    "order": 6,
                                    "detail":"Batter the beaten egg and bread crumbs in that order."
                                ],
                                [
                                    "order": 7,
                                    "detail":"Heat the oil to medium temperature (170-180 degrees), add (6) and return with chopsticks."
                                ],
                                [
                                    "order": 8,
                                    "detail":"Fry for about 3 minutes. Bring to high heat and fry for another minute, remove and drain."
                                ]
                                
                             ]],
                        
                        "6":[
                            "image": "IMG_0830.jpg",
                            "sort": "Main",
                            "common_name": "Boiled mackerel miso",
                            "time": "15minutes",
                            "calorie": "328kcal",
                            "ingredients": [
                                [
                                    "name": "Mackerel (half body)",
                                    "quantity": "400g"
                                    //                                 "seasoning": false
                                    
                                ],
                                [
                                    "name": "Leek",
                                    "quantity": "2 bottle (200g)"
                                    //                                 "seasoning": false
                                    
                                ],
                                [
                                    "name": "Sliced ginger",
                                    "quantity": "8 sheets (12g)"
                                    //                                 "seasoning": false
                                    
                                ],
                                [
                                    "name": "water",
                                    "quantity": "4/3 cup"
                                    //                                 "seasoning": true
                                ],
                                [
                                    "name": "Liquor",
                                    "quantity": " 4 tablespoons"
                                    //                                 "seasoning": true
                                ],
                                [
                                    "name": "sweet sake",
                                    "quantity": "4 tablespoons"
                                    //                                 "seasoning": true
                                ],
                                [
                                    "name": "sugar",
                                    "quantity": "2 tablespoon"
                                    //                                 "seasoning": true
                                ],
                                [
                                    "name": "Hon-Dashi",
                                    "quantity": "4/3 teaspoon (4g)"
                                    //                                 "seasoning": true
                                ],
                                [
                                    "name": "Miso",
                                    "quantity": " 4 tablespoons"
                                    //                                 "seasoning": true
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the mackerel into 4 equal parts while inserting the knife diagonally. Make two shallow cuts in the vertical on the lenticel. Slice the green onions diagonally."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put sliced ginger, water, liquor, sweet sake, sugar, soy sauce and hon-dashi  in a frying pan and heat it over high heat. After boiling, put the mackerel in (1) with the skin facing up, and simmer for about 1 minute while sprinkling the broth with a spoon."
                                ],
                                [
                                    "order": 3,
                                    "detail": "When the color of the mackerel changes, adjust the heat so that the broth foams, cover it, and simmer for 5 minutes."
                                ],
                                [
                                    "order": 4,
                                    "detail":"Dissolve half of the miso in the broth and add, and add the green onions from (1). Cover and simmer for about 2 minutes. Remove the lid, melt and add the remaining miso, and simmer until glossy."
                                ]
                            ]
                        ],
                        
                        "7":[
                            "image": "IMG_0830.jpg",
                            "sort": "Main",
                            "common_name": "Japanese style pasta",
                            "time": "15minutes",
                            "calorie": "812kcal",
                            "ingredients": [
                                [
                                    "name": "spaghetti",
                                    "quantity": "400g"
                                    //                                            "seasoning": false
                                    
                                ],
                                [
                                    "name": "bacon",
                                    "quantity": "120g"
                                    //                                            "seasoning": false
                                    
                                ],
                                [
                                    "name": "Hon-dashi",
                                    "quantity":"4 teaspoon"
                                    //                                            "seasoning": true
                                    
                                ],
                                [
                                    "name": "soy sauce",
                                    "quantity": "2 teaspoon"
                                    //                                            "seasoning": true
                                ],
                                [
                                    "name": "Grated radish",
                                    "quantity": "120g"
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Chopped glue",
                                    "quantity": "a little"
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Olive Oil",
                                    "quantity": "4 tablespoons"
                                    //                                            "seasoning": true
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the bacon into strips. Add salt to plenty of hot water and display spaghetti on time.Boil and raise in a colander to drain. Save the boiled juice."
                                ],
                                [
                                    "order": 2,
                                    "detail": " Put olive oil and bacon (1) in a frying pan and heat.Add spaghetti from (1), 1 cup of boiled juice, soy sauce, and Hon-Dashi.Serve in 3 bowls, grate radish and sprinkle with chopped paste."
                                ]
                            ]
                            
                        ],
                        "8":[
                            "image": "IMG_0830.jpg",
                            "sort": "Main",
                            "common_name": "Finish with a thick egg! Basic Oyakodon",
                            "time": "15minutes",
                            "calorie": "613kcal",
                            "ingredients": [
                                [
                                    "name": "Chicken thigh",
                                    "quantity": "200g"
                                    //                                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Onions / small",
                                    "quantity": "1 piece"
                                    //                                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Mitsuba",
                                    "quantity":"Appropriate amount"
                                    //                                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "egg",
                                    "quantity": "4 pieces"
                                    //                                                "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "3/2 cup"
                                    //                                                "seasoning": true
                                ],
                                [
                                    "name": "Hon-Dashi",
                                    "quantity": "1 teaspoon"
                                    //                                                "seasoning": true
                                ],
                                [
                                    "name": "sugar",
                                    "quantity": "1 tablespoon"
                                    //                                                "seasoning": true
                                ],
                                [
                                    "name": "soy sauce",
                                    "quantity": "4 tablespoons"
                                    //                                                "seasoning": true
                                ],
                                [
                                    "name": "sweet sake",
                                    "quantity": "4 tablespoons"
                                    //                                                "seasoning": true
                                ],
                                [
                                    "name": "rice",
                                    "quantity": "800g"
                                    //                                                "seasoning": false
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut chicken into 2 cm squares and slice onions into thin slices. Cut the mitsuba into 2 cm lengths."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put water, Hon-Dashi, sugar, soy sauce, and mirin in a small frying pan and boil. Add the chicken and onions from (1) and simmer on medium heat for 3 minutes, sprinkle in the beaten egg, and simmer in a soft-boiled state."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Sprinkle half the amount on rice and sprinkle the brim of (1)."
                                ]
                            ]
                        ],
                        "9":[
                            "image": "IMG_0830.jpg",
                            "sort": "Main",
                            "common_name": "Plump juicy hamburger steak",
                            "time": "25minutes",
                            "calorie": "448kcal",
                            "ingredients": [
                                [
                                    "name": "Aibiki meat",
                                    "quantity": "400g"
                                    //                                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "Consomme Granule Type",
                                    "quantity": "1 tablespoon"
                                    //                                                    "seasoning": true
                                    
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity":"a little"
                                    //                                                    "seasoning": true
                                    
                                ],
                                [
                                    "name": "Chopped onion",
                                    "quantity": "1 piece (200g)"
                                    //                                                    "seasoning": false
                                ],
                                [
                                    "name": "Bread crumbs",
                                    "quantity": "1/2 cup (20g)"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "milk",
                                    "quantity": "1/4 cup"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "Beaten egg",
                                    "quantity": "1 piece"
                                    //                                                    "seasoning": false
                                ],
                                [
                                    "name": "Bean sprouts",
                                    "quantity": "1 bag (200g)"
                                    //                                                    "seasoning": false
                                ],
                                [
                                    "name": "Consomme Granule Type",
                                    "quantity": "1 tablespoon"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "tomato ketchup",
                                    "quantity": "3 tablespoon"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "Worcestershire sauce",
                                    "quantity": "3 tablespoon"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "Liquor",
                                    "quantity": "2 tablespoons"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "milk",
                                    "quantity": "1 1/2 tablespoon",
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "salad oil",
                                    "quantity": "3 tablespoon"
                                    //                                                    "seasoning": true
                                ],
                                [
                                    "name": "Baby leaf",
                                    "quantity": "Appropriate amount"
                                    //                                                    "seasoning": false
                                ],
                                [
                                    "name": "Mini Tomato",
                                    "quantity": "8 pieces"
                                    //                                                    "seasoning": false
                                ],
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Heat 1 tablespoon of oil in a frying pan, fry the onions until lightly colored and let cool. Combine the bread crumbs with milk and moisten."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put minced meat, consomme and pepper in a bowl and mix well. Add the onion / bread crumbs and beaten egg from (1) and mix further. Divide it into 4 equal parts, shape it into an oval shape, and make a slight depression in the center."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Place the bean sprouts on a heat-resistant plate, sprinkle with consomme, cover with plastic wrap, and heat in a microwave oven (600W) for about 2 minutes and 30 seconds to mix."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Heat 2 tablespoons of oil in a frying pan, bake the seeds of (2) on high heat for 1 minute, turn over, cover and bake on low heat for 5 minutes."
                                ],
                                [
                                    "order": 5,
                                    "detail": "Serve in a bowl and add bean sprouts, baby leaf and cherry tomatoes from (3). Add tomato ketchup, worcestershire sauce, sake and milk to the gravy left in the frying pan, boil and sprinkle on the hamburger steak."
                                ]
                            ]
                        ],
                        "15":[
                            "image": "IMG_0830.jpg",
                            "sort": "Main",
                            "common_name": "Cream stew with chicken",
                            "time": "45minutes",
                            "calorie": "411kcal",
                            "ingredients": [
                                [
                                    "name": "Chicken thigh",
                                    "quantity": "1 sheet"
                                    //                                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "Sugar",
                                    "quantity": "1/2 teaspoon"
                                    //                                                        "seasoning": true
                                    
                                ],
                                [
                                    "name": "Potatoes",
                                    "quantity":"2 pieces"
                                    //                                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "onion",
                                    "quantity": "1 piece"
                                    //                                                        "seasoning": false
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity": "One"
                                ],
                                [
                                    "name": "broccoli",
                                    "quantity": "1/2 piece (150g)"
                                    //                                                        "seasoning": false
                                ],
                                [
                                    "name": "Cake flour",
                                    "quantity": "3 tablespoon"
                                    //                                                        "seasoning": true
                                ],
                                [
                                    "name": "milk",
                                    "quantity": "2 1/2 cup"
                                    //                                                        "seasoning": true
                                ],
                                [
                                    "name": "water",
                                    "quantity": "2 cups"
                                    //                                                        "seasoning": true
                                ],
                                [
                                    "name": "Consomme solid type",
                                    "quantity": "1 piece"
                                    // "seasoning": true
                                ],
                                [
                                    "name": "Bay leaf",
                                    "quantity": "1 sheet"
                                    // "seasoning": false
                                ],
                                [
                                    "name": "solt",
                                    "quantity": "1 tablespoons"
                                    //     "seasoning": true
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity": "a little"
                                    // "seasoning": true
                                ],
                                [
                                    "name": "White wine",
                                    "quantity": "1 tablespoon"
                                    // "seasoning": true
                                ],
                                [
                                    "name": "butter",
                                    "quantity": "2 tablespoons"
                                    //"seasoning": true
                                ],
                                [
                                    "name": "salad oil",
                                    "quantity": "1 tablespoon"
                                    //                                                        "seasoning": true
                                ],
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the potatoes into 4 equal parts. Cut the onions into combs and the carrots into small pieces. Divide the broccoli into small bunches and boil it down. Cut chicken into bite-sized pieces, season with salt, lightly roast in a frying pan, and remove."
                                ],
                                [
                                    "order": 2,
                                    "detail": "In a pan, heat 1 tablespoon butter and oil over medium heat, add the onions from (1) and fry quickly. Add the potatoes from (1) and fry, add the carrots from (1), and fry until the oil is all over."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Turn off the heat, sprinkle in the flour, mix the whole, and fry over medium heat. Add milk, water, consomme and bay leaf and bring to a boil."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Boil the potatoes until they are cooked for 15 to 20 minutes, stirring them halfway so that the bottom does not burn."
                                ],
                                [
                                    "order": 5,
                                    "detail": "Put the chicken back in (1), add salt and pepper, simmer for 5 minutes, and add broccoli, white wine, and 1 tablespoon butter from (1) to adjust the taste."
                                ]
                            ]
                        ],
                        
                        "11":["image": "IMG_0830.jpg",
                              "sort": "Side dish",
                              "common_name": "Fried Chicken",
                              "time": "20minutes",
                              "calorie": "336kcal",
                              "ingredients": [
                                [
                                    "name": "Chicken thigh or fried chicken",
                                    "quantity": "2(500g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Maru Chcken soup",
                                    "quantity": "2 teaspoon"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "liquor",
                                    "quantity": "4 teaspoons"
                                    //                                "seasoning": true
                                    
                                ],
                                [
                                    "name": "Grated ginger",
                                    "quantity": "2 teaspoons"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Soy sauce",
                                    "quantity": "2 teaspoons"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity": "A little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Cake flour",
                                    "quantity": "6 tablespoons"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "potato starch",
                                    "quantity": "2 tablespoons"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Salad oil",
                                    "quantity": "Appropriate amount"
                                    //                                "seasoning": true
                                ]
                                
                              ],
                              "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut chicken into bite-sized pieces. Put the chicken, Maru chicken broth, liquor, Grated ginger, Soy sauce and Pepper in a bowl and rub in ntil the juice is gone."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put oil in a frying pan to a height of 3cm and heat to a low temperature(160℃).Immeiately before frying, soak Cake flour and potato starch in the chicken of 1 well and quickly put it in hot oil."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Turn upside down on the medium heat and fry for 3-4mintes, turn to high heat until the outside is crispy. Fry for about 1 mnute. Drain the oil the surface of the oil and remove it."
                                ]
                              ]
                        ],
                        
                        "12":[
                            "image": "IMG_0830.jpg",
                            "sort": "Side dish",
                            "common_name": "Kinpira burdock",
                            "time": "25minutes",
                            "calorie": "77kcal",
                            "ingredients": [
                                [
                                    "name": "Burdock",
                                    "quantity": "one"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity": "1/3"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "Red karagarashi",
                                    "quantity":"1/2"
                                    //                                    "seasoning": false
                                    
                                ],
                                [
                                    "name": "Hon-Dashi",
                                    "quantity": "1/2 teaspoon"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "water",
                                    "quantity": "1/2 cup"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "sugar",
                                    "quantity": "1/2 tablespoon"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "soy sauce",
                                    "quantity": "1 tablespoon"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": "sweet sake",
                                    "quantity": "1 tablespoon"
                                    //                                    "seasoning": true
                                ],
                                [
                                    "name": " dark sesame oil",
                                    "quantity": "1 tablespoons"
                                    //                                    "seasoning": false
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut burdock root and carrot into small pieces. Cut the red karagarashi into small pieces, excluding the seeds."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Heat sesame oil in a pan and add half of (1) burdock, carrot, red karagarashi and Hon-dashi. Add and fry."
                                ],
                                [
                                    "order": 3,
                                    "detail": " When the vegetables are tender, add water, the remaining Hon-Dashi, sugar, soy sauce, sweet sake and stir to make the juice succulent.Boil until it is gone."
                                ]
                            ]
                        ],
                        "13":[
                            "image": "IMG_0830.jpg",
                            "sort": "Side dish",
                            "common_name": "JBoiled Tosa of bamboo shoots",
                            "time": "20minutes",
                            "calorie": "86kcal",
                            "ingredients": [
                                [
                                    "name": "Boiled bamboo shoots",
                                    "quantity": "500g"
                                    //                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "Water",
                                    "quantity": "1 1/2 cup"
                                    //                                        "seasoning": true
                                    
                                ],
                                [
                                    "name": "Hon-dashi",
                                    "quantity":"2/3 teaspoon"
                                    //                                        "seasoning": true
                                    
                                ],
                                [
                                    "name": "sweet sake",
                                    "quantity": "3 tablespoon"
                                    //                                        "seasoning": true
                                ],
                                [
                                    "name": "soy sauce",
                                    "quantity": "2 tablespoons"
                                    //                                        "seasoning": true
                                ],
                                [
                                    "name": "Shaving",
                                    "quantity": "10g"
                                    //                                        "seasoning": true
                                ],
                                [
                                    "name": "With tree buds and taste",
                                    "quantity": "a little"
                                    //                                      "seasoning": true
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Divide the tips of bamboo shoots into 6 to 8 pieces vertically. Cut the others into 1 cm thick slices and cut into 4 equal parts."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put bamboo shoots water, Hon-dashi and (1) in a pan and let them boil for a while. Add sweet sake, soy sauce, season, cover with a drop lid and simmer for about 15 minutes."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Sprinkle the shavings on the finish, put it in a bowl, and decorate the tree buds as you like."
                                ]
                            ]
                        ],
                        "14":[
                            "image": "IMG_0830.jpg",
                            "sort": "Side",
                            "common_name": "Easy in the microwave! potato salad",
                            "time": "20minutes",
                            "calorie": "260kcal",
                            "ingredients": [
                                [
                                    "name": "Potatoes",
                                    "quantity": "4 pieces"
                                    //                                            "seasoning": false
                                    
                                ],
                                [
                                    "name": "Water",
                                    "quantity": "2 tablespoon"
                                    //                                            "seasoning": false
                                    
                                ],
                                [
                                    "name": "Consomme Granule Type",
                                    "quantity":"2 teaspoon"
                                    //                                            "seasoning": true
                                    
                                ],
                                [
                                    "name": "Onion",
                                    "quantity": "1/4 piece"
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Cucumber",
                                    "quantity": "1"
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Loin ham",
                                    "quantity": "4 sheets"
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Mayonnaise",
                                    "quantity": "4 tablespoons"
                                    //                                            "seasoning": true
                                ],
                                [
                                    "name": "Salad vegetables",
                                    "quantity": "Appropriate amount"
                                    //                                            "seasoning": false
                                ]
                        ],
                        "recipe": [
                            [
                                "order": 1,
                                "detail": "Peel the potatoes, cut them into 1 cm wide ginkgo biloba, put them in a plate, sprinkle with water and consomme, cover with plastic wrap, and heat in a microwave oven (600 W) for 6 minutes. Steam for 5 minutes and crush roughly."
                            ],
                            [
                                "order": 2,
                                "detail": "Cut the onion into thin slices and the cucumber into small pieces. Cut the ham in half and cut into 1 cm widths."
                            ],
                            [
                                "order": 3,
                                "detail": "Put the onions and cucumbers from (2) in a bowl, sprinkle with a little salt (not included in the amount), and when it becomes soft, squeeze the water."
                            ],
                            [
                                "order": 4,
                                "detail": "Put (1) potatoes, (2) ham, and (3) onions and cucumbers in another bowl, and add mayonnaise.Serve in 5 bowls and serve with salad vegetables."
                            ]
                            ]
                        ],
                        "10":[
                            "image": "IMG_0830.jpg",
                            "sort": "Side",
                            "common_name": "New potato German fries",
                            "time": "30minutes",
                            "calorie": "188kcal",
                            "ingredients": [
                                [
                                    "name": "New potato",
                                    "quantity": "450g"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "New onions",
                                    "quantity": "1/2 (80g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Bacon",
                                    "quantity":"50g"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Consomme Granule Type",
                                    "quantity": "2 teaspoon"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Solt",
                                    "quantity": " a little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "salad oil ",
                                    "quantity": "3 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Chopped parsley",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Coarse black pepper",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the potatoes into 5 mm wide slices with the skin on and expose to water.Put potatoes and 1/4 cup of water (outside the amount) in a heat-resistant dish, wrap it, and wrap it.Heat in the microwave (600W) for about 8 minutes until the bamboo skewers pass smoothly."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Cut the onion into thin slices and the bacon into 1 cm width."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Heat 2 teaspoons of oil in a frying pan and bake both sides of the potatoes in (1) fragrantly.Sprinkle 1 teaspoon of consomme and take it out."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Heat 1 teaspoon of oil in the frying pan of (3), add the onions of (2) and fry quickly.Cover and steam over low heat for 3 minutes."
                                ],
                                [
                                    "order": 5,
                                    "detail": "Add bacon from (2) and 1 teaspoon of consomme and fry, then add potatoes from (3).Put it back in and stir-fry, and add salt to taste.Serve in 6 bowls and sprinkle with parsley and pepper."
                                ]
                            ]
                        ],
                        "16":[
                            "image": "IMG_0830.jpg6",
                            "sort": "Side dish",
                            "common_name": "Avocado mini salad",
                            "time": "5minutes",
                            "calorie": "186kcal",
                            "ingredients": [
                                [
                                    "name": "Avocado",
                                    "quantity": "2 piece"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "lemon juice",
                                    "quantity": "1 teaspoon"
                                    //                                "seasoning": true
                                    
                                ],
                                [
                                    "name": "Cucumber",
                                    "quantity":" two"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Cherry tomato 1/2 pack",
                                    "quantity": "200g"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Hon-Dashi Konbu Dashi",
                                    "quantity": "1/2 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Olive Oil",
                                    "quantity": "1 tablespoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "lemon juice",
                                    "quantity": "4 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "solt",
                                    "quantity": "1/2 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Pepper ",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the cucumber in half vertically and cut into 2 cm long pieces.Cherry tomatoes take calyx."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Make a cut in half the length of the avocado, remove the seeds, and remove the seeds.Peel and cut into 2 cm squares and sprinkle with lemon juice."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Mix 'Konbu Dashi', olive oil, lemon juice, salt and pepper in a bowl to make a dressing.Add cucumbers and cherry tomatoes from (1) and avocado from (2) and serve in a bowl."
                                ]
                                
                                
                            ]
                            
                        ],
                        "17":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Miso soup with cabbage and tofu",
                            "time": "10minutes",
                            "calorie": "60kcal",
                            "ingredients": [
                                [
                                    "name": "Silken tofu",
                                    "quantity": "1/2 chome (150g)"
                                    //                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "cabbage",
                                    "quantity": "2 sheets (100g)"
                                    //                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity":"1/3 bottle (50g)"
                                    //                                        "seasoning": false
                                    
                                ],
                                [
                                    "name": "onion",
                                    "quantity": " 1/2 piece (100g)"
                                    //                                        "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "3 cups"
                                    //                                        "seasoning": true
                                ],
                                [
                                    "name": "Hon-Dashi",
                                    "quantity": "1 teaspoon (4g)"
                                    //                                        "seasoning": true
                                ],
                                [
                                    "name": "Miso",
                                    "quantity": "2 tablespoons"
                                    //                                        "seasoning": true
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut tofu into 1.5 cm squares. Cut cabbage into small pieces and carrots into small pieces. Cut the onion into combs."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put water and hon-dashi in a pan and heat it. Add the tofu, cabbage, carrots and onions from (1) and simmer."
                                ],
                                [
                                    "order": 3,
                                    "detail": " When the vegetables are tender, melt in the miso, warm until just before boiling, and turn off the heat."
                                ]
                            ]
                        ],
                        "18":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Egg soup",
                            "time": "10minutes",
                            "calorie": "59kcal",
                            "ingredients": [
                                [
                                    "name": "egg",
                                    "quantity": "2 pieces",
                                    //                                            "seasoning": false
                                ],
                                [
                                    "name": "Leek",
                                    "quantity": "10cm"
                                    //                                            "seasoning": false
                                    
                                ],
                                [
                                    "name": "Water",
                                    "quantity":"3 cup"
                                    //                                            "seasoning": true
                                    
                                ],
                                [
                                    "name": "Flavor Paste",
                                    "quantity": "24cm (17g)"
                                    //                                            "seasoning": false
                                ]
                                
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Break the egg into a bowl. Cut the green onions into small pieces."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put water and flavor paste in a pan and heat it. Add the green onions from (1). After boiling, pour the egg liquid from (1) into a thread, turn off the heat, and mix gently with chopsticks."
                                ]
                            ]
                        ],
                        "19":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Minestrone with plenty of vegetables",
                            "time": "30minutes",
                            "calorie": "142kcal",
                            "ingredients": [
                                [
                                    "name": "onion",
                                    "quantity": "1 piece"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Potatoes",
                                    "quantity": "1 piece"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity":"2/3"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Garlic",
                                    "quantity": "1"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Cut tomato can",
                                    "quantity": "300g"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "600ml"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Consomme Granule Type",
                                    "quantity": "2 tablespoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "solt",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Olive Oil",
                                    "quantity": "2 tablespoon"
                                    //                                "seasoning": true
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut onions, potatoes and carrots into cubes of about 1 cm. Expose the potatoes to water and wipe off the water. Garlic is finely chopped."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put the garlic and olive oil from (1) in a pan and fry on medium heat. When the garlic is bubbling, reduce the heat to low."
                                ],
                                [
                                    "order": 3,
                                    "detail": "TWhen it is slightly colored, add the onions from (1) and fry on medium heat until tender. Add the carrots and potatoes from (1) in the order of canned tomatoes and fry for a while."
                                ],
                                [
                                    "order": 4,
                                    "detail": "Add water and simmer on medium heat, remove the lye, reduce the heat to low, add 'consomme', cover and simmer for about 20 minutes. Adjust the taste with salt and pepper."
                                ]
                            ]
                        ],
                        
                        "20":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Sweet potato soup vegetables",
                            "time": "20minutes",
                            "calorie": "218kcal",
                            "ingredients": [
                                [
                                    "name": "Sweet potato",
                                    "quantity": "4/3 bottles (300g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity": "2/3 bottle (100g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "onion",
                                    "quantity":"1/2 piece (100g)"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "bacon",
                                    "quantity": "2 sheet (50g)"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "600g"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Consomme solid type",
                                    "quantity": "2 piece"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "butter",
                                    "quantity": "20g"
                                    //                                "seasoning": true
                                ]
                                
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut sweet potatoes into 1 cm thick slices (half-moon slices if large) and expose to water to drain. Cut carrots and onions into thin slices, and cut bacon into 1 cm wide pieces."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put butter and (1) sweet potatoes, carrots, onions and bacon in a pan and fry lightly. When the oil is all over, add A and simmer until the vegetables are tender."
                                ]
                                
                            ]
                        ],
                        "21":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Sweet potato soup vegetables",
                            "time": "20minutes",
                            "calorie": "218kcal",
                            "ingredients": [
                                [
                                    "name": "Potatoes",
                                    "quantity": "Three"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "onion",
                                    "quantity": "1/4 piece"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "butter",
                                    "quantity":"20g"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Cake flour",
                                    "quantity": "1 tablespoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "water",
                                    "quantity": "2 cups"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Consomme Chicken solid type",
                                    "quantity": "2 pieces"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "milk",
                                    "quantity": "2 cups"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Pepper",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Chopped parsley",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Slice the potatoes into small pieces and slice the onions into thin slices."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Melt butter in a pan and fry the onions in (1) over low heat until clear. Add cake flour and fry further."
                                ],
                                [
                                    "order": 3,
                                    "detail": "(1) Add the potatoes, water and consomme and heat over medium heat. After boiling, reduce the heat to low, cover and simmer for 30 minutes until the potatoes are soft."
                                ],
                                [
                                    "order": 4,
                                    "detail": "In a pan, crush the potatoes with a whisk, add milk, and sprinkle with pepper."
                                ],
                                [
                                    "order": 5,
                                    "detail": "Serve in a bowl and sprinkle with parsley."
                                ]
                            ]
                            
                        ],
                        
                        "22":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Chinese wonton soup",
                            "time": "5minutes",
                            "calorie": "49kcal",
                            "ingredients": [
                                [
                                    "name": "Wonton with meat",
                                    "quantity": "8 pieces"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Carrots",
                                    "quantity": "1/4 (40g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Garlic",
                                    "quantity":"1/2 bundle (50g)"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "3 cups"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Chinese Aji",
                                    "quantity": "1 tablespoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Cut small onions into small pieces",
                                    "quantity": "Appropriate amount"
                                    //                                "seasoning": false
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut carrots into strips and garlic chives into zaku."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put water and Chinese flavor in a pan and heat it. When it boils, add the carrots, garlic chives and wontons from (1) and let it boil for a while."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Serve in a bowl and sprinkle with small onions."
                                ]
                            ]
                        ],
                        
                        "23":[
                            "image": "IMG_0830.jpg",
                            "sort": "Soup",
                            "common_name": "Chinese-style vermicelli soup with plenty of vegetables",
                            "time": "15minutes",
                            "calorie": "54kcal",
                            "ingredients": [
                                [
                                    "name": "Carrots",
                                    "quantity": "6cm (60g)"
                                    //                                "seasoning": false
                                    
                                ],
                                [
                                    "name": "Garlic",
                                    "quantity": "1/3 bundle (40g)"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Bean sprouts",
                                    "quantity":"80g"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "Vermicelli",
                                    "quantity": "40g"
                                    //                                "seasoning": false
                                ],
                                [
                                    "name": "water",
                                    "quantity": "3 cup"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Maru chicken soup <Salt content>",
                                    "quantity": "2 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "oyster sauce",
                                    "quantity": "2 teaspoon"
                                    //                                "seasoning": true
                                ],
                                [
                                    "name": "Black pepper",
                                    "quantity": "a little"
                                    //                                "seasoning": true
                                ]
                            ],
                            "recipe": [
                                [
                                    "order": 1,
                                    "detail": "Cut the vermicelli in half with kitchen scissors. Cut carrots into strips and garlic chives into zaku."
                                ],
                                [
                                    "order": 2,
                                    "detail": "Put water, whole chicken broth, and (1) vermicelli and carrots in a pan and heat them. When the vermicelli becomes soft, add (1) garlic and bean sprouts and simmer. When it's cooked, add 'oyster sauce' to taste."
                                ],
                                [
                                    "order": 3,
                                    "detail": "Serve in a bowl and sprinkle with black pepper."
                                ]
                                
                            ]
                        ],
                        
                        "24":[
                        "image": "IMG_0830.jpg",
                         "sort": "Soup",
                         "common_name": "Eggplant and fried miso soup",
                         "time": "15minutes",
                         "calorie": "82kcal",
                         "ingredients": [
                            [
                                "name": "Eggplant",
                                "quantity": "Three"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "Carrots",
                                "quantity": "1/2 (80g)"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "Shimeji mushroom",
                                "quantity":"1 pack"
//                                "seasoning": false
                                
                            ],
                            [
                                "name": "Fried tofu",
                                "quantity": "1 sheet"
//                                "seasoning": false
                            ],
                            [
                                "name": "water",
                                "quantity": "3 cups"
//                                "seasoning": true
                            ],
                            [
                                "name": "Hon-Dashi Niboshi 8g stick",
                                "quantity": "1/2"
//                                "seasoning": true
                            ],
                            [
                                "name": "Miso",
                                "quantity": "3 tablespoon"
//                                "seasoning": true
                            ],
                            [
                                "name": "Cut small onions into small pieces",
                                "quantity": "Appropriate amount"
//                                "seasoning": false
                            ]
                        ],
                        "recipe": [
                            [
                                "order": 1,
                                "detail": "Eggplant is sliced into 5 to 6 mm wide slices and exposed to water to remove lye and drain. Cut carrots into chopped shimeji mushrooms and divide shimeji mushrooms into small bunches."
                            ],
                            [
                                "order": 2,
                                "detail": "For deep-fried tofu, pour boiling water over it to drain the oil, cut it in half vertically, and cut it into 1 cm wide pieces."
                            ],
                            [
                                "order": 3,
                                "detail": "Put water and 8g stick of Hon-Dashi Iriko Dashi in a pan and heat it. After boiling, add (1) eggplant, carrot, shimeji mushroom and (2) fried tofu and simmer. When the vegetables are tender, add the miso and let it boil for a while."
                            ],
                            [
                                "order": 4,
                                "detail": "Serve in a bowl and sprinkle with small onions."
                            ]
                           ]
                        ],
                        
                        "25":[
                            "image": "IMG_2256.JPG",
                            "sort": "Side",
                            "common_name": "Mizuna and tuna salad",
                            "time": "3minutes",
                            "calorie": "119kcal",
                            "ingredients": [
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
                                ]],
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
                        ]
                        
]



var commonDictionary = [
    "2021/03/23(Tue)": ["id": ["15","25"]],
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

let mainRecipeIdList = ["1","2","4","5"]
let sideRecipeIdList = ["10", "11", "12", "13"]
let soupRecipeIdList = ["20", "21", "22"]

let springList = ["1","10","13","25"]

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
