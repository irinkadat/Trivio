//
//  Users.swift
//  hackathon
//
//  Created by Irinka Datoshvili on 05.07.24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let rank: Int
    let name: String
    let score: Int
    let profileImageName: String
}

let users: [User] = [
    User(rank: 1, name: "Nika", score: 657, profileImageName: "person.crop.circle"),
    User(rank: 2, name: "User2", score: 542, profileImageName: "person.crop.circle"),
    User(rank: 3, name: "User3", score: 432, profileImageName: "person.crop.circle"),
    User(rank: 4, name: "User4", score: 321, profileImageName: "person.crop.circle"),
    User(rank: 5, name: "User5", score: 210, profileImageName: "person.crop.circle"),
    User(rank: 6, name: "User6", score: 109, profileImageName: "person.crop.circle"),
    User(rank: 7, name: "User7", score: 98, profileImageName: "person.crop.circle"),
    User(rank: 8, name: "User8", score: 87, profileImageName: "person.crop.circle"),
    User(rank: 9, name: "User9", score: 76, profileImageName: "person.crop.circle"),
    User(rank: 10, name: "User10", score: 65, profileImageName: "person.crop.circle")
]
