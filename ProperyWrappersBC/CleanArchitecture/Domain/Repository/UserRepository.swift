//
//  UserRepository.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation



protocol UserRepository {
    
    func fetchUser() async throws -> [User]
}


