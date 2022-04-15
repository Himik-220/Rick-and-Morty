//
//  NetworkDataFetcher.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import Foundation

class NetworkDataFetcher {
    
    static let shared = NetworkDataFetcher()
    
    func fetchHeroes(responce: @escaping (Results?) -> Void) {
        NetworkManager.shared.getResult { (result) in
            switch result {
            case .success(let data):
                do {
                    let heroes = try JSONDecoder().decode(Results.self, from: data)
                    responce(heroes)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    responce(nil)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                responce(nil)
            }
        }
    }
}
