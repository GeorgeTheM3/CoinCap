//
//  DataModel.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import Foundation
import UIKit

class DataModel {
    static func getPrice(price: String) -> String {
        if let number = Double(price) {
            let numb = round(number * 1000)/1000
            return String(numb)
        }
        return price
    }
}
