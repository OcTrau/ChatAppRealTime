//
//  clipShapeMessengerView.swift
//  ChatAppRealTime
//
//  Created by Bao Pham on 28/09/2024.
//

import SwiftUI


//set image with func path
struct clipShapeMessengerView: Shape {
    let isCurrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topLeft,
                                    .topRight,
                                    isCurrentUser ? .bottomLeft: .bottomRight

                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    clipShapeMessengerView(isCurrentUser: true)
}
