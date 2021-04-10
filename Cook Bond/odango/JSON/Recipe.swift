//
//  Recipe.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/06.
//

import Foundation

struct Recipe: Decodable {
    var id: String
    var image: String
    var name: String
    var sort: String
    var time: String?
    var calorie: String?
    var ingredients: String?
    var quantity: String?
    var recipe: String?
}



func getData() {
    
    let recipe = """
    {
    "id": "1",
    "image": "",
    "sort": "",
    "name": "ハンバーグ",
    "time": "15分",
    "ingredients": [
    {
    "name": "あいびき肉",
    "quantity": "400g"
    },
    {
    "name": "みじん切りにした玉ねぎ",
    "quantity": "１個分"
    }
    ]

    "recipe": [
    {
    "order": 1
    "detail": "フライパンに油大さじ１を熱し、玉ねぎを薄く色づくまで..."
    }]
    }
    """
    
    // String -> Data に変換
    let data = recipe.data(using: .utf8)
    print("変換されました")
    // JSON をデコード
    let result = try! JSONDecoder().decode(Recipe.self, from: data!)
    print("デコードされました")
    /*do {
        let jsonString = Recipe.self
        let jsondata = recipe.data(using: .utf8)!
        let recipe = try JSONDecoder().decode(Recipe.self, from: jsondata)
    } catch {
        print(error)
        print(error.localizedDescription)
    }*/
    
    // 結果を表示してみる
    print("name: \(result.name)")
    print("time: \(String(describing: result.time))")
    
    print("debug_called")
    /*①プロジェクト内にある"template.json"ファイルのパス取得
    guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
        fatalError("ファイルが見つからない")
    }
    print("hikari")

    //②template.jsonの内容をData型プロパティに読み込み
    guard (try? Data(contentsOf: url)) != nil else {
        fatalError("ファイル読み込みエラー")
    }
    print("kaoru")
    
    //③JSONデコード処理
    let decoder = JSONDecoder()
    guard let recipes = try? decoder.decode([Recipe].self, from: data!)else {
    fatalError("JSON読み込みエラー")
    }
    print("hoge")

    //④データ確認
    for recipe in recipes {
    print(recipe)
        
    }
    print("done")
    */
    
    /*デコード処理
    do {
        let jsonString = Recipe.self
        let jsonData = jsonString.data(using: .utf8)!
        let recipe = try JSONDecoder().decode(Recipe.self, from: jsonData)
    } catch {
        print(error)
        print(error.localizedDescription)
    }*/
    
}





