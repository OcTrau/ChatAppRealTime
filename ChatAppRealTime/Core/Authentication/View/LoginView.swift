//
//  LoginView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 23/08/2024.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
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
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(40)
                        .padding(.horizontal, 24)
                }
                
//                forgot password
                Button{
                    print("Forgot password, ")
                }label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
//                login button
                Button{ 
                    Task{
                        try await viewModel.login()
                    }
                    
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(40)
                    
                }
                .padding(.vertical)
                
//                facebook login
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("or")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack{
                    Image("facebook-icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
//                sign up link
                NavigationLink{
                    RegisterView()
                        .navigationBarBackButtonHidden()
                    
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
}

#Preview {
    LoginView()
}
