//
//  User.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation

struct UserResponse: Decodable {
   
    let users: [User]
    let total,skip, limit: Int
}


struct User: Decodable, Identifiable, Hashable {
    let id: Int
    let firstName, lastName, email: String
    let age: Int
}
