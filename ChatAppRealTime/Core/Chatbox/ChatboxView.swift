//
//  ChatboxView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 27/09/2024.
//

import SwiftUI

struct ChatboxView: View {
    @State private var messengerText = ""
    var body: some View {
        VStack {
            ScrollView{
                VStack(spacing: 4){
                    SetProfileImageView(user: User.MOCK_User, size: .size80)
                    VStack{
                        Text("Swarm")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }

                }
                ForEach(0...15, id: \.self){ message in
                    setMessengerUserView(isCurrentUser: Bool.random())
                    
                }
  
            }
            Spacer()
            ZStack(alignment: .trailing){
                           TextField("Messenger...", text: $messengerText, axis: .vertical)
                               .padding(12)
                               .padding(.trailing, 48)   // text field and button
                               .background(Color(.systemGroupedBackground))
                               .clipShape(Capsule())
                               .font(.subheadline)
                           Button{
                               print("Send messs")
                               
                           }label: {
                               Text("send")
                                   .fontWeight(.semibold)
                           }
                           .padding(.horizontal)
                       }
        }
        
    }
}

#Preview {
    ChatboxView()
}
