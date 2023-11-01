//
//  ContentView.swift
//  Comcast
//
//  Created by Hanh Vo on 10/24/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var vm = ViewModel(networkClient: NetworkService())
    var body: some View {
        List(vm.articles, id: \.self){article in
            Text(article.title ?? "NA")
            if let url = article.urlToImage {
                ImageView(urlString: url)
            } else {
                Image(systemName: "Photo")
            }
        }
        .onAppear(perform: {
            vm.getArticles()
        })
        
    }
}

#Preview {
    ContentView()
}
