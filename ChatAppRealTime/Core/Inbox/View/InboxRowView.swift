//
//  InboxRowView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            SetProfileImageView(user: User.MOCK_User, size: .size64)
            VStack(alignment: .leading, spacing: 4){
                Text("Swarm")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("some messenger sbdisdsidbslddbhls")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack{
                Text("Monday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
