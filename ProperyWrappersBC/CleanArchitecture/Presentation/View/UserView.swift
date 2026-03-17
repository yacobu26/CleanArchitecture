//
//  UserView.swift
//  ProperyWrappersBC
//
//  Created by G Yacobu on 16/03/26.
//

import SwiftUI

struct UserView: View {
    
    @StateObject private var userVM: UserViewModel
    
    
    init(userVM: UserViewModel) {
        _userVM = StateObject(wrappedValue: userVM)
    }
    
    var body: some View {
        VStack {
            
            if userVM.isLoading {
                ProgressView("Loading Users...")
            } else if !userVM.errorMessage.isEmpty {
                Text(userVM.errorMessage)
                    .foregroundStyle(.red)
            }else {
                List(userVM.userList,id: \.self) { user in
                    Text("\(user.firstName): \(user.lastName)")
                    Text(user.email)
                    
                }
            }
        }
        .onAppear {
            Task {
                await userVM.loadUserData()
            }
        }
        
    }
}

#Preview {
    UserViewBuilder.build()
}

#Preview {
    UserViewMockBuilder.build()
}


struct UserViewBuilder {
    
    static func build() -> UserView {
        let apiService = APIServiceHelper()
        let repository = UserRepositoryImpl(apiService: apiService)
        let useCase: UserUseCaseProtocol = UserUseCase(repository: repository)
        let viewModel = UserViewModel(useCase: useCase)
        return UserView(userVM: viewModel)
        
    }
}

struct UserViewMockBuilder {
    
    static func build() -> UserView {
        let mockRepository = MockUserRepository()
        let useCase: UserUseCaseProtocol = UserUseCase(repository: mockRepository)
        let viewModel = UserViewModel(useCase: useCase)
        return UserView(userVM: viewModel)
    }
}
