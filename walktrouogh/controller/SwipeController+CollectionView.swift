//
//  SwipeController+CollectionView.swift
//  walktrouogh
//
//  Created by alouane on 11/3/18.
//  Copyright © 2018 plutus. All rights reserved.
//

import UIKit

extension SwipeController {
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width  , height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pageControle.currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
    }
    
    func setupButtonControls(){
        let yellowV = UIView()
        yellowV.backgroundColor = .yellow
        
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton, pageControle, nextButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        NSLayoutConstraint.activate([bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
