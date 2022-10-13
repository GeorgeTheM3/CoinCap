//
//  NetworkManager.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion: @escaping (T) -> Void) {
        guard let urlReuest = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlReuest) { data, _, error in
            if let error {
                print(error.localizedDescription)
            }
            guard let data = data else { return}
            do {
                let result = try JSONDecoder().decode(model.self, from: data)
                completion(result)
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func loadImage(url: String, completion: @escaping (UIImage) -> Void) {
        let imageURL = URL(string: url)
        guard let urlPhoto = imageURL else { return }
        guard let imageData = try? Data(contentsOf: urlPhoto) else { return }
        if let image = UIImage(data: imageData) {
            completion(image)
        }
    }
}
