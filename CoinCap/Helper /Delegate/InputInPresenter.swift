//
//  OutputPresenter.swift
//  CoinCap
//
//  Created by Георгий Матченко on 23.10.2022.
//

import Foundation

protocol InputInPresenter: AnyObject {
    func getData<T>(data: T?) -> T?
}
