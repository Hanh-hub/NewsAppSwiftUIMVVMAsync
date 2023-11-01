//
//  Model.swift
//  Comcast
//
//  Created by Hanh Vo on 10/24/23.
//

import Foundation

struct Response: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Hashable {

    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String? //Date?
    let content: String?
}

