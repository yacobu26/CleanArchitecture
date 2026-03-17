//
//  MockUserRepository.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation


class MockUserRepository: UserRepository {
    
    func fetchUser() async throws -> [User] {
        
        return [User(id: 1, firstName: "John", lastName: "Doe", email: "john@test.com", age: 25),
        User(id: 2, firstName: "Alice", lastName: "Smith", email: "alice@test.com", age: 30),
        User(id: 3, firstName: "Robert", lastName: "Brown", email: "robert@test.com", age: 28) ]
    }
    
    
}
