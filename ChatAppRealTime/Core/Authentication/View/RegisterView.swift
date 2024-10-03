//
//  RegisterView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 24/08/2024.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
//                logo
            Image("messenger-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
//                text fields
            VStack(spacing: 15){
                TextField("Enter Your Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(40)
                    .padding(.horizontal, 24)
                TextField("Enter Your name", text: $viewModel.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(40)
                    .padding(.horizontal, 24)
                SecureField("Enter your password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(40)
                    .padding(.horizontal, 24)
            }
            
            
//                login button
            Button{
                Task{
                    try await viewModel.createUser()
                }
            }label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(40)
                
            }
            .padding(.vertical)
            
            
            Spacer()
            
            
            
            Divider()
//                sign up link
            Button{
                dismiss()
                
                
            }label: {
                HStack(spacing: 3){
                    Text("You dont have account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegisterView()
}
