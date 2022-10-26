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
    
    private lazy var coinDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension CoinDetailViewController: CryptoProtocol {
    func getCryptoCoin(data: CryptoCoin) {
        print(data)
    }
}
