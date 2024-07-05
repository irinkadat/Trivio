//
//  ProductView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                            .font(.system(size: 14))
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
