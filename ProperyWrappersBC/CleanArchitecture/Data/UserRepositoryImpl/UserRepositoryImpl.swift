//
//  UserRepositoryImpl.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation


class UserRepositoryImpl: UserRepository {
    
   private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceHelper) {
        self.apiService = apiService
    }
    
    func fetchUser() async throws -> [User] {
        return try await apiService.fetchUserData()
    }
    
}
