//
//  QuizSearchView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 03.07.24.
//

import SwiftUI

struct QuizSearchView: View {
    @ObservedObject var viewModel = QuizViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            CustomDropdown(label: "Select Category", selection: $viewModel.selectedCategory, options: viewModel.categories, isDisabled: false)
            
            if !viewModel.selectedCategory.isEmpty {
                CustomDropdown(label: "Select Sub-Category", selection: $viewModel.selectedSubCategory, options: viewModel.subCategories, isDisabled: viewModel.selectedCategory.isEmpty)
            }
            
            if !viewModel.selectedSubCategory.isEmpty {
                CustomDropdown(label: "Select Level", selection: $viewModel.selectedLevel, options: viewModel.levels, isDisabled: viewModel.selectedCategory.isEmpty)
            }
        }
    }
}


#Preview {
    QuizSearchView()
}
