//
//  ViewController.swift
//  walktrouogh
//
//  Created by alouane on 10/31/18.
//  Copyright © 2018 plutus. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainRed =  UIColor(red: 171/255, green:0/255, blue: 60/255, alpha: 1)
}

class ViewController: UIViewController {
    
    
    //Make sure you do encapsulation
    private let previousButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Prev", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let nextButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.gray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.mainRed, for: .normal)
        return btn
    }()
    
        private let pageControle : UIPageControl  = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainRed
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControls()
    }
    
    fileprivate func setupButtonControls(){
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

