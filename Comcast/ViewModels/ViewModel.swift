//
//  ViewModel.swift
//  Comcast
//
//  Created by Hanh Vo on 10/25/23.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String = ""
    
    var networkClient: NetworkService
    
    init(networkClient: NetworkService) {
        self.networkClient = networkClient
    }
    
    
    func getArticles(){
        Task {
            do {
                let response: Response =  try await networkClient.fetchData(urlString: APIEndPoint.articleUrl)
                self.articles = response.articles
            } catch (let networkError as NetworkError) {
                print("Asgsgasgsgasg")
                print(networkError.localizedDescription)
                errorMessage = networkError.description
            } catch let error {
                print("hrehreer")
                print(error.localizedDescription)
                errorMessage = "unknown error occured"
            }

        }
        
    }
    
}
