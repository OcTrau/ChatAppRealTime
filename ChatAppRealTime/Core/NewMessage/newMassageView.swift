//
//  newMassageView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 25/09/2024.
//

import SwiftUI

struct newMassageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACT")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(0 ... 10, id: \.self) {user in
                    VStack {
                        HStack{
                            SetProfileImageView(user: User.MOCK_User, size: .size40)
                            Text("Swarm Legent of valua")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                        
                    }
                }
                
                
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Cencel"){
                        dismiss()
                    }
                    .foregroundColor(.gray)
                }
        }
        }
    }
}

#Preview {
    NavigationStack{
        newMassageView()
    }
}
