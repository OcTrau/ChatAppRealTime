//
//  SetProfileImageView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 27/09/2024.
//

import SwiftUI



enum ProfileImageSize{
    case size28
    case size32
    case size40
    case size56
    case size64
    case size80
    
    var dimention: CGFloat{
        switch self{
        case .size28: return 28
        case .size32:
            return 32
        case .size40:
            return 40
        case .size56:
            return 56
        case .size64:
            return 64
        case .size80:
            return 80
        }
    }
    
}

struct SetProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    var body: some View {
        if let imageUrl = user?.profileImageURL{
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimention, height: size.dimention)
                .clipShape(Circle())
            
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimention, height: size.dimention)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    SetProfileImageView(user: User.MOCK_User, size: .size28)
}
