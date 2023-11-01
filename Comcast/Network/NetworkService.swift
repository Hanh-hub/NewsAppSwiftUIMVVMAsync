//
//  NetworkService.swift
//  Comcast
//
//  Created by Hanh Vo on 10/24/23.
//

import Foundation

protocol NetworkProtocol {
    
}

class NetworkService {
    func fetchData<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        
       let (data, response)  = try await URLSession.shared.data(for: urlRequest)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        do {
            let decodedResponse =  try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
            
        } catch  let error{
            throw NetworkError.decodingError(error)
        }
    }
}
