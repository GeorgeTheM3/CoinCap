//
//  ChangeCoinInConverterView.swift
//  CoinCap
//
//  Created by Георгий Матченко on 11.11.2022.
//

import Foundation
import UIKit

class ChangeCoinInConverterViewController: UIViewController {
    // properties hold a first or second coin
    private var curentCoin = 1
    
    //delegate
    var delegateToConverterCoinsViewController: OutputControlletProtocol?
    
    private lazy var coinsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        return tableView
    }()
    
    init(curentCoin: Int, delegate: OutputControlletProtocol ) {
        self.curentCoin = curentCoin
        delegateToConverterCoinsViewController = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewsToParentView()
    }
    
    private func addSubviewsToParentView() {
        view.addSubview(coinsTableView)
    }
    
    // func to pass selected coin to ConverterCoinsViewController
    private func changeCoin(coin: CryptoCoin) {
        delegateToConverterCoinsViewController?.outputInfo(info: (coin, curentCoin))
        dismiss(animated: true)
    }
}

extension ChangeCoinInConverterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LocalStorage.shared.coinsStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = LocalStorage.shared.coinsStorage[indexPath.row].data.name
        cell.imageView?.image = LocalStorage.shared.coinsStorage[indexPath.row].image
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

// pass to ConverterCoinsViewController info about new selected coin
extension ChangeCoinInConverterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = LocalStorage.shared.coinsStorage[indexPath.row]
        changeCoin(coin: coin)
    }
}
