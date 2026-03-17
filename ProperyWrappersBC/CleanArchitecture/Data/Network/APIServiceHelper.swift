//
//  APIServiceHelper.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetchUserData() async throws -> [User]
}


class APIServiceHelper: APIServiceProtocol {
    
    func fetchUserData() async throws -> [User] {
        
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
    
            let decodedResult = try JSONDecoder().decode(UserResponse.self, from: data)
            return decodedResult.users
       
    }
    
}
