//
//  ProfileResponse.swift
//  TCAA
//
//  Created by 김수완 on 2023/09/04.
//

import Foundation

// MARK: - Welcome
struct RandomUserResponse: Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let picture: Picture
}

// MARK: - Location
struct Location: Decodable {
    let country: String
}

// MARK: - Name
struct Name: Decodable {
    let first, last: String
}

// MARK: - Picture
struct Picture: Decodable {
    let medium: String
}


extension RandomUserResponse {
    func asModel() -> [ProfileModel] {
        return self.results.map {
            ProfileModel(
                gender: $0.gender == "male" ? .male : .female,
                name: "\($0.name.first) \($0.name.last)",
                email: $0.email,
                picture: URL(string: $0.picture.medium)!,
                location: $0.location.country
            )
        }
    }
}
