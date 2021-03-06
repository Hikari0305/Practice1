//
//  Recipe.swift
//  odango UIKit
//
//  Created by 吉田光 on 2021/03/06.
//

import Foundation

struct Recipe: Codable {
    var id: Int
    var name: String
    var time: Int
    var ingredients: String
    var quantity: String
    var recipe: String
}

//①プロジェクト内にある"template.json"ファイルのパス取得
guard let url = Bundle.main.url(forResource: "template", withExtension: "json") else {
    fatalError("ファイルが見つからない")
}

//②template
guard let data = try? Data(contentsOf: url) else {
    fatalError("ファイル読み込みエラー")
}
