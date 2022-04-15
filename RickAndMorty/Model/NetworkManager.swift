//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    func getResult(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, responce, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(error!))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}

