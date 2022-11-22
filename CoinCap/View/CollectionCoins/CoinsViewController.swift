//
//  ViewController.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import UIKit

class CoinsViewController: UIViewController {
    // sizeForItem
    let spaceSize = CGFloat(15)
    let spacesBetweenLines = CGFloat(10)
    let numberOfItems = CGFloat(1)
    
    var isLoading = false // downloading data from json status

    private let presenter = Presenter()
    private lazy var criptoCoins: [CryptoCoin] = []
    
    private var delegateToCustomCell: DelegateToViewProtocol?
    
    private lazy var coinsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CoinCustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.frame = CGRect(x: .zero, y: .zero, width: view.frame.width, height: view.frame.height)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setViewController()
        presenter.getData(url: Constants.shared.getJsonURL(key: 20))
        pullToRefreshCoinsData()
    }
    
    private func setViewController() {
        navigationItem.title = "CoinCap"
        coinsCollectionView.backgroundColor = .systemGray5
        presenter.setViewToDelegate(view: self)
    }
    
    private func addSubviews() {
        view.addSubview(coinsCollectionView)
    }
    
    // pull to refresh
    private func pullToRefreshCoinsData() {
        let refresh = UIRefreshControl()
        refresh.tintColor = .orange
        refresh.addTarget(self, action: #selector(pullToRefreshCoinDataAction), for: .valueChanged)
        coinsCollectionView.refreshControl = refresh
        coinsCollectionView.prefetchDataSource = self
    }
    // pull to refresh action
    @objc private func pullToRefreshCoinDataAction() {
        presenter.refreshCoinsCrices(numberOfCoins: criptoCoins.count)
        coinsCollectionView.refreshControl?.endRefreshing()
    }
}

// MARK: UICollectionViewDataSource
extension CoinsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        criptoCoins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CoinCustomCell {
            let image = criptoCoins[indexPath.item].image
            let data = criptoCoins[indexPath.item].data
            delegateToCustomCell = cell
            delegateToCustomCell?.delgateToView(info: (image, data))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaces = (numberOfItems + 1) * spaceSize
        let widthCell = collectionView.frame.width - CGFloat(spaces)
        return CGSize(width: widthCell, height: (widthCell/4.5))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacesBetweenLines
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CoinsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCoin = criptoCoins[indexPath.row]
        let controller = CoinDetailViewController(curentCoin: selectedCoin)
        present(controller, animated: true)
    }
}

//MARK: UICollectionViewDataSourcePrefetching
extension CoinsViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let maxCell = indexPaths.map({$0.row}).max() else { return }
        if maxCell > (criptoCoins.count - 5) && !isLoading {
            isLoading = true
            let offset = criptoCoins.count
            presenter.getData(url: Constants.shared.getJsonOffsetURL(offset: offset, limit: 10))
        }
    }
}

//MARK: Delegate CryptoProtocol
extension CoinsViewController: CryptoProtocol {
    // func for refreshing data in criptoCoins
    func refreshCoinPrices(data: CryptoData) {
        for index in criptoCoins.indices {
            criptoCoins[index].data = data.data[index]
        }
        DispatchQueue.main.async {
            self.coinsCollectionView.reloadData()
        }
    }
    // func for get data from json
    func getCryptoCoin(data: [CryptoCoin]) {
        criptoCoins += data
        isLoading = false
        DispatchQueue.main.async {
            self.coinsCollectionView.reloadData()
        }
    }
}
