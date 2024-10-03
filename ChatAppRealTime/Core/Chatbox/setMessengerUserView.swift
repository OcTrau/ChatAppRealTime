//
//  setMessengerUserView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 28/09/2024.
//

import SwiftUI

struct setMessengerUserView: View {
    let isCurrentUser: Bool
    var body: some View {
        HStack{
            if isCurrentUser{
                Spacer()
                Text("Is current User, but i dont have eberythink, i cant do it, buts ai can belie in my mine")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(clipShapeMessengerView(isCurrentUser: isCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
                
            }else{
                HStack(alignment: .bottom, spacing: 12){
                    SetProfileImageView(user: User.MOCK_User, size: .size28)
                    
                    Text("Is current User, horizone offffffffffffffmskdmnskd nkosnfsdfknorcm cwnfwj")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                    //clipshape set form clipshapeMesssengerView func path
                        .clipShape(clipShapeMessengerView(isCurrentUser: isCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.60, alignment: .leading)
                    Spacer()
                }
                
            }
        }
        .padding(.horizontal, 8)
        
    }

}

#Preview {
    setMessengerUserView(isCurrentUser: true)
}
