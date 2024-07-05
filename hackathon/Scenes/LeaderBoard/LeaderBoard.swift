//
//  LeaderBoard.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import SwiftUI

struct Leaderboard: View {
    @ObservedObject var viewmodel = ProductViewModel()
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Text("ლიდერბორდი")
                            .font(.system(size: 26))
                            .bold()
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            ProfileImageView(imageName: "badge1", size: 30)
                            
                            Text("\(viewmodel.userCoins)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(users) { user in
                                UserRowView(user: user)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                }
                .padding(.vertical)
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
