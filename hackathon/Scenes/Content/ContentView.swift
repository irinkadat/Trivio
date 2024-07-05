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
        case home, leaderboard, quiz, cart, profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(selectedTab == .home ? "home1Fill" : "home1")
                    Text("Home")
                }
                .tag(Tab.home)
            
            Leaderboard()
                .tabItem {
                    Image(selectedTab == .leaderboard ? "starFill" : "star")
                    Text("Board")
                }
                .tag(Tab.leaderboard)
            
            QuizView(selectedTab: $selectedTab)
                .tabItem {
                    Image(selectedTab == .quiz ? "quizFill" : "quiz")
                    Text("Quiz")
                }
                .tag(Tab.quiz)
            
            ProductView()
                .tabItem {
                    Image(selectedTab == .cart ? "cartFill" : "cart")
                    Text("Shop")
                }
                .tag(Tab.cart)
            
            ProfileView()
                .tabItem {
                    Image(selectedTab == .profile ? "personFIll" : "person")
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
        .environmentObject(viewModel)
        
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuizViewModel())
    }
}
