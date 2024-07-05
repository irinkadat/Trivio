//
//  ProductListView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
//    var currentCoins = 50
    
    var body: some View {
        
        VStack {
            if viewModel.products.isEmpty {
                ProgressView()
                
            } else {
                HStack {
                    Text("Products")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    HStack(spacing: 8) {
                        ProfileImageView(imageName: "trv", size: 28)
                        
                        
                        Text("\(viewModel.userCoins) TRV")
                            .font(.title3)
                    }
                    .padding(.trailing, 10)
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 14) {
                        ForEach(viewModel.products) { product in
                            ProductRowView(product: product, currentCoins: viewModel.userCoins) {
                                if viewModel.userCoins >= product.price {
                                    alertMessage = "You bought \(product.name) successfully!"
                                } else {
                                    alertMessage = "Not enough coins to buy \(product.name)."
                                }
                                showAlert = true
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Purchase"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

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
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
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
