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
    
    private lazy var coinsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.frame = CGRect(x: .zero, y: .zero, width: view.frame.width, height: view.frame.height)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setViewController()
    }
    
    private func setViewController() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(coinsCollectionView)
    }
}

extension CoinsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaces = (numberOfItems + 1) * spaceSize
        let widthCell = collectionView.frame.width - CGFloat(spaces)
        return CGSize(width: widthCell, height: (widthCell/5))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacesBetweenLines
    }
}

extension CoinsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected \(indexPath.row)")
    }
}

