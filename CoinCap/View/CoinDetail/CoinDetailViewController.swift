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
    
    private var curentCoin: CryptoCoin
    
    private lazy var coinDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: 400)
        return tableView
    }()
    
    init(curentCoin: CryptoCoin) {
        self.curentCoin = curentCoin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setViewController()
        view.backgroundColor = .red
    }
    
    private func setViewController() {
        navigationItem.title = "CoinCap"
        coinDetailTableView.backgroundColor = .systemGray5
        presenter.setViewToDelegate(view: self)
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(coinDetailTableView)
    }
}

extension CoinDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let coin = curentCoin
        switch indexPath.row {
        case 0:
            cell.imageView?.image = coin.image
            cell.textLabel?.text = coin.data.name
        case 1:
            let text = coin.data.symbol
            cell.textLabel?.text = "Short name: \(text)"
        case 2:
            let text = coin.data.priceUsd
            cell.textLabel?.text = "Price: \(text)"
        case 3:
            let text = coin.data.changePercent24Hr
            cell.textLabel?.text = "Change for 24h: \(text)"
        case 4:
            if let text = coin.data.vwap24Hr {
                cell.textLabel?.text = "vwap24Hr: \(text)"
            }
        case 5:
            if let text = coin.data.supply {
                cell.textLabel?.text = "supply: \(text)"
            }
        case 6:
            if let text = coin.data.maxSupply {
                cell.textLabel?.text = "maxSupply: \(text)"
            } else {
                cell.textLabel?.text = "maxSupply: - "
            }
        case 7:
            if let text = coin.data.marketCapUsd {
                cell.textLabel?.text = "marketCapUsd: \(text)"
            }
        case 8:
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
    func refreshCoinPrices(data: CryptoData) {
    }
    
    func getCryptoCoin(data: [CryptoCoin]) {
    }
}
