//
//  UserRowView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            Text("#\(user.rank)")
                .font(.title2)
                .bold()
                .padding(.leading, 10)
                .foregroundColor(.white)
            
            
            Image(systemName: user.profileImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.leading, 4)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title3)
                    .bold()
                    .foregroundColor(user.rank == 1 ? .customPurple2 : .customPurple2.opacity(0.9))
                
                Text("\(user.score) TRV")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.leading, 14)
            
            Spacer()
        }
        .frame(height: 84)
        .padding(.horizontal)
        .background(user.rank == 1 ? .customPurple : .customPurple.opacity(0.7))
        .cornerRadius(16)
    }
}
