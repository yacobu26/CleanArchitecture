//
//  UserViewModel.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import Foundation
import Combine

@MainActor
class UserViewModel: ObservableObject {
    
    @Published var userList: [User] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    private let useCase: UserUseCaseProtocol
    
    init(useCase: UserUseCaseProtocol) {
        self.useCase = useCase
    }
   
    func loadUserData() async {
        
        isLoading = true
      
        do {
            userList = try await self.useCase.execute()
        }
        catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
     
    }
}

