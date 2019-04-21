//
//  UXCollectionView.swift
//  Utilities
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
public class UXCollectionView<M: SectionModel>: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ItemListener {
    public typealias Model = M
    public typealias ChildIntentType = Model.Coordinator.Link.Link.IntentType
    public typealias ParentIntentType = Model.ParentCoordinator.Link.Link.IntentType
    private var collectionView: UICollectionView!
    public var model: Box<Model?> = Box(nil)
    // MARK: - Input
    // MARK: - Output
    public var childInteractor: Box<ChildIntentType?> = Box(nil)
    public var parentInteractor: Box<ParentIntentType?> = Box(nil)
    public init(model: Model?, direction: UICollectionView.ScrollDirection = .vertical, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.collectionView = UICollectionView.collectionView(width: 300, height: 300, direction: direction, paging: Model.isPaging)
        add(views: collectionView)
        collectionView.constrainInView(view: self, top: 0, left: 0, right: 0, bottom: 0)
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(Model.Coordinator.ItemLink.View.self, forCellWithReuseIdentifier: Model.Coordinator.ItemLink.View.identifier)
        self.model.accept(model)
        self.bindModel()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    public func collection() -> UICollectionView? {
        return collectionView
    }
    func bindModel() {
        model.bind ({ [weak self] model, _ in
            self?.collectionView.reloadData()
        })
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {}
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Model.numberOfSections
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.element()?.numberOfItems(section: section) ?? 0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Model.Coordinator.ItemLink.View.identifier, for: indexPath) as? Model.Coordinator.ItemLink.View {
            model.element()?.implementCoordinator(for: cell, indexPath: indexPath, listener: self)
            return cell as! UICollectionViewCell
        } else {
            return UICollectionViewCell()
        }
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = model.element()?.itemSize(reference: self.frame.size) ?? self.frame.size
        return size
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Model.interItemSpacing
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        model.element()?.willEndDragging(referenceSize: self.frame.size, withVelocity: velocity, targetContentOffset: targetContentOffset, listener: self)
    }
}
