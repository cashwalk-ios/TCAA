//
//  UserModel.swift
//  TCAA
//
//  Created by 김수완 on 2023/08/22.
//

import Foundation

struct ProfileModel {
    let id: UUID = .init()
    let gender: Gender
    let name: String
    let email: String
    let picture: URL?
    let location: String
}


struct MockData {
    static var items = [ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    )].sorted(by: { $0.email < $1.email })
    static var items1 = [ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    ), ProfileModel(
        gender: .man,
        name: "qwer",
        email: String(Int.random(in: 0...100)),
        picture: URL(string: "https://i.kym-cdn.com/entries/icons/facebook/000/045/763/tsfishcover.jpg"),
        location: "qwer"
    )]
}

