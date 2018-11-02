//
//  SwipeController.swift
//  walktrouogh
//
//  Created by alouane on 11/1/18.
//  Copyright © 2018 plutus. All rights reserved.
//

import UIKit

class SwipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let pages = [Page(imageName: "step1", headerText: "Welcome to the game", bodyText: "This is the most aweomse gmae are you ready?"), Page(imageName: "step2", headerText: "Enjoy playing the game", bodyText: "Earn points as you goand solve interesting puzzles?"), Page(imageName: "step3", headerText: "Play with your friends", bodyText: "Multiplaye ris fun with your friend and family"), Page(imageName: "step4", headerText: "Share and conquere", bodyText: "Share the game and earn points for each play now?")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
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

}
