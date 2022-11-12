//
//  ChangeCoinInConverterView.swift
//  CoinCap
//
//  Created by Георгий Матченко on 11.11.2022.
//

import Foundation
import UIKit

class ChangeCoinInConverterViewController: UIViewController {
    private lazy var coinsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewsToParentView()
    }
    
    private func addSubviewsToParentView() {
        view.addSubview(coinsTableView)
    }
}

extension ChangeCoinInConverterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LocalStorage.shared.coinsStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

extension ChangeCoinInConverterViewController: UITableViewDelegate {
    
}
