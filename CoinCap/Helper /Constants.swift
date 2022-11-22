//
//  Constants.swift
//  CoinCap
//
//  Created by Георгий Матченко on 15.10.2022.
//

import Foundation

class Constants {
    static let shared = Constants()

    
//    public let jsonURL = "https://api.coincap.io/v2/assets"
    private let jsonURL = "https://api.coincap.io/v2/assets"
    private let baseImageURL = "https://assets.coincap.io/assets/icons/"
    private let jsonLimit = "limit="
    private let jsonOffset = "offset="
    private let question = "?"
    private let ampersand = "&"
    private let endImageURL = "@2x.png"
    
    func getImageURL(key: String) -> String {
        return baseImageURL + key + endImageURL
    }
    
    func getJsonURL(key: Int) -> String {
        return jsonURL + question + jsonLimit + "\(key)"
    }
    
    func getJsonOffsetURL(offset: Int, limit: Int) -> String {
        return jsonURL + question + jsonOffset + "\(offset)" + ampersand + jsonLimit + "\(limit)"
    }
    
    // constraints converter view
    static let paddingTop = CGFloat(50)
    static let paddingsInLine = CGFloat(10)
    static let paddingBetweenLines = CGFloat(15)
    static let heightMax = CGFloat(50)
    static let height = CGFloat(30)
    static let heightMin = CGFloat(20)
    
    //constraints collection coins cell
    static let cellpaddingSide = CGFloat(15)
    static let cellHeigthImage = CGFloat(25)
}
