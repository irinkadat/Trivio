//
//  LeaderBoard.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let score: Int
}

struct Leaderboard: View {
    @EnvironmentObject var viewModel: QuizViewModel

    let users: [User] = [
        User(rank: 1, name: "User1", score: 657435),
        User(rank: 2, name: "User2", score: 542810),
        User(rank: 3, name: "User3", score: 432109),
        User(rank: 4, name: "User4", score: 321098),
        User(rank: 5, name: "User5", score: 210987),
        User(rank: 6, name: "User6", score: 109876),
        User(rank: 7, name: "User7", score: 98765),
        User(rank: 8, name: "User8", score: 87654),
        User(rank: 9, name: "User9", score: 76543),
        User(rank: 10, name: "User10", score: 65432)
    ]

    var body: some View {
        NavigationStack {
            VStack {
                Text("Leaderboard 🏆")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                List(users) { user in
                    HStack {
                        Text("#\(user.rank)")
                            .font(.title2)
                            .bold()
                            .frame(width: 50, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title3)
                                .bold()
                            
                            Text("\(user.score) points")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(user.rank == 1 ? Color.purple.opacity(0.1) : Color.purple.opacity(0.05))
                    .cornerRadius(10)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
            .environmentObject(QuizViewModel())
    }
}
