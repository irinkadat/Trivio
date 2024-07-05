//
//  ProductViewModel.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    @Published var userCoins: Int = 150
    private var cancellable: AnyCancellable?
    
    func fetchProducts() {
        guard let url = URL(string: "https://kopa.ge/ProductAPIView/") else {
            errorMessage = "Invalid URL"
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                }
            }, receiveValue: { products in
                self.products = products
            })
    }
}
