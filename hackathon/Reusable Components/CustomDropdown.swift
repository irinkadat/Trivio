//
//  CustomDropdown.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 04.07.24.
//

import SwiftUI

struct CustomDropdown: View {
    var label: String
    @Binding var selection: String
    var options: [String]
    
    @State private var isOpen = false
    var isDisabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            
            Button(action: {
                if !isDisabled {
                    self.isOpen.toggle()
                }
            }) {
                HStack {
                    Text(selection.isEmpty ? "Select" : selection)
                        .foregroundColor(isDisabled ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(Angle(degrees: isOpen ? 180 : 0))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.purple.opacity(0.6), lineWidth: 1)
                )
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
                .opacity(isDisabled ? 0.65 : 1.0)
            }
            .frame(width: 340)
            
            if isOpen && !isDisabled {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            self.selection = option
                            self.isOpen = false
                        }) {
                            HStack {
                                Text(option)
                                    .foregroundColor(.black)
                                    .padding()
                                
                                Spacer()
                                
                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 20)
                                }
                            }
                            .frame(width: 340, height: 50, alignment: .leading)
                            .background(Color.white)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
            }
            Spacer()
                .frame(height: 8)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomDropdown(label: "Select Category", selection: .constant(""), options: ["College Student", "School Student", "Programming"], isDisabled: false)
}
