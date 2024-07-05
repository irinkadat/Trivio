//
//  CustomButton.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let imageName: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .frame(width: 16, height: 16)
                }
            }
            .font(.system(size: 16))
            .foregroundColor(.white)
            .padding(10)
            .background(Color.customPurple)
            .cornerRadius(16)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Search", imageName: "magnifyingglass") {
        }
    }
}
