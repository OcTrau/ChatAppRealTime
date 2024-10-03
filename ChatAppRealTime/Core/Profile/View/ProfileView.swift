//
//  ProfileView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        VStack {
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem){
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                    } else {
                        SetProfileImageView(user: user, size: .size80)
                    }
                    }
                    
                    
                    
                    
                    
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            List{
                Section{
                    ForEach(SettingOptionViewMadels.allCases){ option in
                    
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24 )
                                .foregroundColor(option.imageBackgroughColor)
                            Text(option.title)
                                .font(.subheadline)
                        }
                        
                    }
                }
                Section{
                    Button("Delete Account")
                    {
                        
                    }
                    Button("Log Out")
                    {
                        AuthService.shared.signOut()
                        
                    }
                }
                .foregroundColor(.red)


            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_User)
}

