//
//  Results.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import Foundation

struct Results: Codable {
    let heroes: [Heroes]
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}

struct Heroes: Codable {
    let id: Int
    let name, gender, species, status, image: String
    let location: Location
    let episode: [String]
}

struct Location: Codable {
    let lastLocation: String
    enum CodingKeys: String, CodingKey {
        case lastLocation = "name"
    }
}

