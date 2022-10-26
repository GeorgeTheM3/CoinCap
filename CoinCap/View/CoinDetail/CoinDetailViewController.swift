//
//  CoinDetailView.swift
//  CoinCap
//
//  Created by Георгий Матченко on 26.10.2022.
//

import Foundation
import UIKit

class CoinDetailViewController: UIViewController {
    private let presenter = Presenter()
    private lazy var criptoCoins: [CryptoCoin] = []
    
    private lazy var coinDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    private func setViewController() {
        navigationItem.title = "CoinCap"
        coinDetailTableView.backgroundColor = .systemGray5
        presenter.setViewToDelegate(view: self)
    }
    
    private func addSubviews() {
        view.addSubview(coinDetailTableView)
    }
}

extension CoinDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let coin = LocalStorage.shared.coinsStorage[0]
        switch indexPath.row {
        case 0:
            let text = coin.data.rank
            cell.textLabel?.text = "Rank: \(text)"
        case 1:
            let text = coin.data.symbol
            cell.textLabel?.text = "Short name: \(text)"
        case 2:
            let text = coin.data.name
            cell.textLabel?.text = "Name: \(text)"
        case 3:
            let text = coin.data.priceUsd
            cell.textLabel?.text = "Price: \(text)"
        case 4:
            let text = coin.data.changePercent24Hr
            cell.textLabel?.text = "Change for 24h: \(text)"
        case 5:
            if let text = coin.data.vwap24Hr {
                cell.textLabel?.text = "vwap24Hr: \(text)"
            }
        case 6:
            if let text = coin.data.supply {
                cell.textLabel?.text = "supply: \(text)"
            }
        case 7:
            if let text = coin.data.maxSupply {
                cell.textLabel?.text = "maxSupply: \(text)"
            }
        case 8:
            if let text = coin.data.marketCapUsd {
                cell.textLabel?.text = "marketCapUsd: \(text)"
            }
        case 9:
            if let text = coin.data.volumeUsd24Hr {
                cell.textLabel?.text = "volumeUsd24Hr: \(text)"
            }
        default:
            cell.textLabel?.text = "text"
        }
        return cell
    }
}

extension CoinDetailViewController: CryptoProtocol {
    func getCryptoCoin(data: CryptoCoin) {
        criptoCoins.append(data)
    }
}
