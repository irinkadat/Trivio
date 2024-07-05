//
//  ProfileView2.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.customPurple.opacity(0.19))
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        ProfileImageView(imageName: "profilePic", size: 120)
                            .padding(.top, 30)
                        
                        Text("Michael Jeferson")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("შესახებ")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(.customPurple)
                    
                    Group {
                        Text("Email: MichaelJepgmail.com")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        
                        Text("Phone: 555-555-555")
                            .fontWeight(.medium)
                        
                        Text("სტატუსი: Active Player")
                            .fontWeight(.medium)
                    }
                    .font(.system(size: 18))
                    
                    VStack(alignment: .leading) {
                        Text("მიღწევები")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(.customPurple)

                        HStack {
                            ProfileImageView(imageName: "badge1", size: 50)
                            ProfileImageView(imageName: "badge2", size: 50)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(.top, 5)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.leading, -90)
        }
    }
}

struct ProfileImageView: View {
    let imageName: String
    let size: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
