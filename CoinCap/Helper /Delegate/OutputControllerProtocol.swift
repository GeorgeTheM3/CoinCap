//
//  OutputAnyProtocol.swift
//  CoinCap
//
//  Created by Георгий Матченко on 05.11.2022.
//

import Foundation

protocol OutputControlletProtocol: AnyObject {
    func outputInfo<T>(info:T?) -> T?
}
