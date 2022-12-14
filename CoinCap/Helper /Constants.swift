//
//  Constants.swift
//  CoinCap
//
//  Created by Георгий Матченко on 15.10.2022.
//

import Foundation

class Constants {
    static let shared = Constants()

    public let jsonURL = "https://api.coincap.io/v2/assets"
    
    private let baseImageURL = "https://assets.coincap.io/assets/icons/"
    private let endImageURL = "@2x.png"
    
    func getImageURL(key: String) -> String {
        return baseImageURL + key + endImageURL
    }
}
