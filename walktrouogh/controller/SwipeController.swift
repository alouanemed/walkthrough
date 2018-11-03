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
    
    let previousButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Prev", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return btn
    }()
    
     let nextButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.gray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.mainRed, for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControle.currentPage + 1, pages.count - 1)
        pageControle.currentPage = nextIndex
        collectionView?.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrevious(){
        let nextIndex = max(pageControle.currentPage - 1, 0)
        pageControle.currentPage = nextIndex
        collectionView?.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControle : UIPageControl  = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainRed
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
}
