//
//  ButtonsActions.swift
//  CoinCap
//
//  Created by Георгий Матченко on 12.11.2022.
//

import Foundation

protocol ButtonsActionsProtocol: AnyObject {
    func tapButton(buttonTag: Int, selector: Selector)
}
