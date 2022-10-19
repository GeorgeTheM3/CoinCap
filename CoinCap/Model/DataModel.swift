//
//  DataModel.swift
//  CoinCap
//
//  Created by Георгий Матченко on 19.10.2022.
//

import Foundation
import UIKit

class DataModel {
    func getPrice(price: String) -> String {
        if let number = Double(price) {
            let numb = round(number * 10)/10
            return String(numb)
        }
        return price
    }
}
