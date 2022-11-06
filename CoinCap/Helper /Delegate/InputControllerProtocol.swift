//
//  InputControllerProtocol.swift
//  CoinCap
//
//  Created by Георгий Матченко on 05.11.2022.
//

import Foundation

protocol InputControlletProtocol: AnyObject {
    func inputInfo<T>(info:T?) -> T?
}
