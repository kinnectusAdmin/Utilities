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
    private var collectionView: UICollectionView!
    // MARK: - Input
    public var model: Box<Model?> = Box(nil)
    public var childInteractor: Box<Intent?> = Box(nil)
    // MARK: - Output
    public var parentInteractor: Box<Intent?> = Box(nil)
    public init(model: Model?, direction: UICollectionView.ScrollDirection = .vertical, frame: CGRect = .zero) {
        super.init(frame: frame)
        self.collectionView = UICollectionView.collectionView(width: 300, height: 300, direction: direction, paging: Model.isPaging)
        add(views: collectionView)
        collectionView.constrainInView(view: self, top: 0, left: 0, right: 0, bottom: 0)
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        Model.registrationItems.forEach { (cellType, identifier) in
            self.collectionView.register(cellType, forCellWithReuseIdentifier: identifier)
        }
        self.model.accept(model)
        self.bindModel()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    public func collection() -> UICollectionView? { return collectionView }
    func bindModel() {
        model.bind ({ [weak self] model, prevModel in
            guard let this = self else { return }
            guard let state = model?.viewState else { return }
            Model.actionForViewState(state, prevModel?.viewState, this.collectionView)
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
        let number = model.element()?.numberOfItems(section: section) ?? 0
        return number
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item  = model.element()?.item(collection: collectionView, indexPath: indexPath) else { return UICollectionViewCell()}
        model.element()?.implementCell(for: item, indexPath: indexPath, listener: self)
        return item as! UICollectionViewCell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = model.element()?.itemSize(reference: self.frame.size, indexPath: indexPath) ?? self.frame.size
        return size
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Model.interItemSpacing
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Model.minimumLineSpacing
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {}
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        model.element()?.willEndDragging(referenceSize: self.frame.size, withVelocity: velocity, targetContentOffset: targetContentOffset, listener: self)
    }
}
