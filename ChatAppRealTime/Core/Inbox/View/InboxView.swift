//
//  InboxView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    
    private var user: User?{
        return viewModel.currentUser
    }
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveScrollView()
                
                List{
                    ForEach(0...10, id: \.self){ meessage in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120 )
                
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            
            
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                newMassageView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        NavigationLink(value: user){
                            SetProfileImageView(user: user, size: .size32)

                        }
                        Text("Chat")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray4))
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    InboxView()
}

