//
//  Profile.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct Profile: View {
    var image: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255), .clear]), startPoint: .top, endPoint: .bottom))
                .frame(width: 50, height: 50)
                .overlay(
                    Image("\(image)")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .fill(.customBlue)
                                .frame(width: 15, height: 15)
                                .overlay(
                                    Text("2")
                                        .padding(5)
                                        .font(.system(size: 9))
                                        .foregroundColor(.white)),
                            alignment: .bottomTrailing)
                )
        }
    }
}
