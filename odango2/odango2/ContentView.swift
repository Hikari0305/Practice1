//
//  ContentView.swift
//  odango2
//
//  Created by 吉田光 on 2021/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TabHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "homekit")
                        Text("ホーム")
                        
                    }
                }.tag(1)
            TabKondateView()
                .tabItem {
                    VStack {
                        Image(systemName: "bold")
                        Text("献立")
                    }
                }.tag(2)
            TabTokoView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("投稿")
                    }
                }.tag(3)
            TabMypageView()
                .tabItem {
                    VStack {
                        Image(systemName: "faceid")
                        Text("マイページ")
                    }
                }.tag(4)
        }
     
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

