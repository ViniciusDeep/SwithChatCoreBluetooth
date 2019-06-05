//
//  ViewController.swift
//  ChatBluetooth
//
//  Created by Vinicius Mangueira Correia on 03/06/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListGroupsController: BaseCollectionController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension ListGroupsController: UICollectionViewDelegateFlowLayout {
    
    @objc fileprivate func changeToCreate() {
        let createGroupVC = CreateGroupController()
        present(UINavigationController(rootViewController: createGroupVC), animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let groupVC = GroupController()
        navigationController?.pushViewController(groupVC, animated: true)
    }
    
    fileprivate func setupCollection() {
        navigationItem.title = "List of Groups"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(changeToCreate))
        collectionView.backgroundColor = .white
        collectionView.register(ListGroupsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: (view.frame.height/2)+200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 10, right: 10)
    }
}

