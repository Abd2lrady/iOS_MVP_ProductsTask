//
//  AdaptiveUICollectionViewLayout.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit


class AdaptiveUICollectionViewLayout: UICollectionViewLayout {
    
    weak var delegate: AdaptiveUICollectionViewLayoutProtocol?
    
    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 2
    private var attributes = [UICollectionViewLayoutAttributes]()
    var contentHeight: CGFloat = 0
    
    var contentWidth: CGFloat {
        guard let collectionView = collectionView
        else { return 0 }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView
        else {
            print("error with layout")
            return
        }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffests = [CGFloat]()
        var yOffests = [CGFloat].init(repeating: 0, count: numberOfColumns)
        
        for column in 0..<numberOfColumns {
            xOffests.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        
        for itemIndex in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: itemIndex, section: 0)
            
            let imageHeight = delegate?.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
            
            let height = cellPadding * 2 + (imageHeight ?? 500)
            
            let frame = CGRect(x: xOffests[column],
                               y: yOffests[column],
                               width: columnWidth,
                               height: height)
            
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let cellAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            cellAttributes.frame = insetFrame
            attributes.append(cellAttributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffests[column] = yOffests[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleAttributes = [UICollectionViewLayoutAttributes]()
        for cellAttribute in attributes {
            if cellAttribute.frame.intersects(rect) {
                visibleAttributes.append(cellAttribute)
            }
        }
        
        return visibleAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributes[indexPath.item]
    }
}
