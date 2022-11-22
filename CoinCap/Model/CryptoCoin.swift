//
//  Model.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import Foundation
import UIKit

class CryptoCoin {
    var data: Coin
    let image: UIImage
    
    init(data: Coin, image: UIImage) {
        self.data = data
        self.image = image
    }
}
