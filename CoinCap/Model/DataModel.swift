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
        guard let number = Double(price) else { return "nil"}
        if number > 1.0 {
            let numb = round(number * 1000)/1000
            return String(numb)
        } else if number > 0.01 {
            let numb = round(number * 100000)/100000
            return String(numb)
        } else {
            let numb = round(number * 10000000)/10000000
            return String(numb)
        }
    }
}
