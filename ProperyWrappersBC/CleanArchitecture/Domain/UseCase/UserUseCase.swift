//
//  UserUseCase.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation


protocol UserUseCaseProtocol {
    func execute() async throws -> [User]
}

class UserUseCase: UserUseCaseProtocol {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute() async throws  -> [User]{
       return try await repository.fetchUser()
    }
}
