//
//  OutputPresenter.swift
//  CoinCap
//
//  Created by Георгий Матченко on 23.10.2022.
//

import Foundation

protocol OutputPresenterProtocol: AnyObject {
    func getInfo<T>(info: T?) -> T?
}
