//
//  ProfileView2.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct ProfileView2: View {
    var body: some View {
        VStack {
            Image("profilePic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.top, 30)
            
            Text("Nika Nozadze")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Email: NikaNoza@gmail.com")
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("Phone: 555-555-555")
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("Accessibility: Enabled")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .padding(.top, 5)
            Spacer()
            
        }
    }
}

#Preview {
    ProfileView2()
}
