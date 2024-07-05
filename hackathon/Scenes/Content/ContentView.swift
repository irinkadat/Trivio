//
//  MainContentView.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = QuizViewModel()
    @State private var selectedTab: Tab = .home
    
    enum Tab: String {
        case home, leaderboard, quiz, profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(Tab.home)
                .environmentObject(viewModel)
            
            Leaderboard()
                .tabItem {
                    Image(systemName: "star")
                    Text("Leaderboard")
                }
                .tag(Tab.leaderboard)
                .environmentObject(viewModel)
            
            QuizView2(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Quiz")
                }
                .tag(Tab.quiz)
                .environmentObject(viewModel)
            
            ProductView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Shop")
                }
                .tag(Tab.profile)
                .environmentObject(viewModel)
            
            ProfileView2()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(Tab.profile)
                .environmentObject(viewModel)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuizViewModel())
    }
}
