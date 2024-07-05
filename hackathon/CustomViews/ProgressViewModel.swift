//
//  ProgressViewModel.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 06.07.24.
//

import SwiftUI
import Combine

class ProgressViewModel: ObservableObject {
    @Published var completedTasks = 17
    @Published var incompleteTasks = 23
    
    var totalTasks: Int {
        completedTasks + incompleteTasks
    }
    
    var percentage: Int {
        guard totalTasks > 0 else { return 0 }
        return completedTasks * 100 / totalTasks
    }
    
    var formattedTaskProgress: String {
        "\(completedTasks)/\(totalTasks)"
    }
    
    var formattedPercentage: String {
        "\(percentage)%"
    }
    
    init(completedTasks: Int, incompleteTasks: Int) {
        self.completedTasks = completedTasks
        self.incompleteTasks = incompleteTasks
    }
}
