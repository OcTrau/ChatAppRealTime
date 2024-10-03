//
//  ActiveScrollView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import SwiftUI

struct ActiveScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(0 ... 10, id: \.self) { user in
                    VStack{
                        ZStack(alignment: .bottomTrailing){
                            SetProfileImageView(user: User.MOCK_User, size: .size64)
                            ZStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 12, height: 12)
                            }
                            
                            
                        }
                        Text("Swarm")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveScrollView()
}
