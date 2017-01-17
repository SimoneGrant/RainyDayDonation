//
//  MenuCollection.swift
//  RainyDayDonation
//
//  Created by Simone on 1/16/17.
//  Copyright © 2017 Simone. All rights reserved.
//

import UIKit
import SnapKit

class Menu: NSObject {
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class MenuCollection: NSObject, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellIdentifier"
    let cellHeight = 50
    var menuController: MapViewController?
    
    let menu: [Menu] = {
        return  [Menu(name: "Map", imageName: "Pittsburgh Map-48"), Menu(name: "Donor's Choose", imageName: "External Link-48"), Menu(name: "Account Details", imageName: "User-48"), Menu(name: "Cancel", imageName: "Delete-48")]
    }()
    
    //MARK: - UIActions
    
    func showMenu() {
        if let window = UIApplication.shared.keyWindow {
            blackScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissMenu)))
            
            //subviews
            window.addSubview(blackScreen)
            window.addSubview(collectionView)
            
            //frames
            blackScreen.frame = window.frame
            blackScreen.alpha = 0
            
            let height: CGFloat = CGFloat(menu.count * cellHeight)
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            //animate
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackScreen.alpha = 1
                //slides in from the bottom
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
        }
    }
    
    func dismissMenu() {
        UIView.animate(withDuration: 0.5) {
            self.blackScreen.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
    
    //MARK: - UICollectionView Delegate/DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCollectionCell
        
        let menuItem = menu[indexPath.item]
        cell.menu = menuItem
        
        return cell
    }
    
    //minimize spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //expand collection view cells horizontally across width of screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: CGFloat(cellHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.blackScreen.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }) { (completed: Bool) in
            let menuItem = self.menu[indexPath.item]
            self.menuController?.navigateToController(menuItem)
        }
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        //register collection view cell
        collectionView.register(MenuCollectionCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK: - Views
    
    internal var blackScreen: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
}

