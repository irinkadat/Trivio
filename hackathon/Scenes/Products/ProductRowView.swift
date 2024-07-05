//
//  ProductRowView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    let currentCoins: Int
    let buyAction: () -> Void
    
    var body: some View {
        HStack {
            if let url = product.productImageURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 50, height: 50)
            } else {
                Image(systemName: "trv")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.customPurple2)
                
                Text("\(product.price) TRV")
                    .font(.subheadline)
                    .foregroundColor(.customPurple2)
            }
            .padding(.leading, 14)
            
            Spacer()
            
            Button(action: buyAction) {
                Text("Buy")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(currentCoins >= product.price ? Color.green : Color.gray)
                    .cornerRadius(16)
            }
        }
        .frame(height: 84)
        .padding(.horizontal)
        .background(Color.customPurple.opacity(0.7))
        .cornerRadius(16)
    }
}
