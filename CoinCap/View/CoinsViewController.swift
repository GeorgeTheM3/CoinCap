//
//  ViewController.swift
//  CoinCap
//
//  Created by Георгий Матченко on 13.10.2022.
//

import UIKit

class CoinsViewController: UIViewController {
    // sizeForItem
    let spaceSize = CGFloat(20)
    let spacesBetweenLines = CGFloat(10)
    let numberOfItems = CGFloat(1)

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
        presenter.getData()
    }
    
    private func setViewController() {
        coinsCollectionView.backgroundColor = .systemGray5
        presenter.setViewToDelegate(view: self)
    }
    
    private func addSubviews() {
        view.addSubview(coinsCollectionView)
    }
}

extension CoinsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        criptoCoins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CoinCustomCell {
            cell.backgroundColor = .white
            let image = criptoCoins[indexPath.item].image
            let title = criptoCoins[indexPath.item].data.name
            delegateToCustomCell = cell
            delegateToCustomCell?.delgateToView(info: (image,title))
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

extension CoinsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(criptoCoins[indexPath.item].data.name)
    }
}

extension CoinsViewController: CryptoProtocol {
    func getCryptoCoin(data: CryptoCoin) {
        criptoCoins.append(data)
        DispatchQueue.main.async {
            self.coinsCollectionView.reloadData()
        }
    }
}
