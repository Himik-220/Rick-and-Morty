//
//  Heroes.swift
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
    let name: String
    let gender: String
    let species: String
    let image: String
}
