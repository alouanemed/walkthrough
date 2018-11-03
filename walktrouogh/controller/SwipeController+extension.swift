//
//  SwipeController_ext.swift
//  walktrouogh
//
//  Created by alouane on 11/3/18.
//  Copyright © 2018 plutus. All rights reserved.
//

import UIKit

extension SwipeController  {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            
            self.collectionViewLayout.invalidateLayout()
            if(self.pageControle.currentPage == 0){
                self.collectionView?.contentOffset = .zero
            }else{
                self.collectionView?.scrollToItem(at: IndexPath(item: self.pageControle.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
}
