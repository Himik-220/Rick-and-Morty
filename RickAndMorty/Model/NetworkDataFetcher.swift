//
//  NetworkDataFetcher.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import Foundation

class NetworkDataFetcher {
    static let shared = NetworkDataFetcher()
    func fetchHeroes<T: Codable>(urlString: String, responce: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        NetworkManager.shared.getResult(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let heroes = try JSONDecoder().decode(T.self, from: data)
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
