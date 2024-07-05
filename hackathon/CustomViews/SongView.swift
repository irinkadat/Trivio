//
//  SCardsView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import Foundation
import SwiftUI

struct SongView: View {
    // MARK: - Properties
    @State private var buttonTapped = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("python")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(18)
            
            // MARK: - Title Text
            Text("Python 2")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 2, leading: 16, bottom: 0, trailing: 0))
            
            Text("advanced")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .padding(.vertical, 3)
                .padding(.horizontal, 12)
                .background(Color.white.opacity(0.2))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
            
            
            
            Spacer().frame(height: 26)
            
            // MARK: - Song Text
            Text("more than 40 Questions on Python Pro")
                .foregroundColor(.white)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .lineLimit(4)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 36))
        }
        .frame(width: 170, height: 232, alignment: .topLeading)
        .background(.customPurple)
        .cornerRadius(18)
        
    }
}

struct NewsView: View {
    @State private var buttonTapped = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image("swift")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(16)
                    .padding([.leading, .top], 14)
                Spacer()
                Text("Intermediate")
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 8)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .padding(EdgeInsets(top: 14, leading: 0, bottom: 0, trailing: 20))
                
            }
            
            // MARK: - Text
            Text("განაგრძე Swift-ის შემდეგი დონე")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 24))
                .lineLimit(2)
        }
        .frame(width: 170, height: 110, alignment: .topLeading)
        .background(buttonTapped ? Color(.customBlue) : Color(.progress))
        .cornerRadius(18)
    }
}
