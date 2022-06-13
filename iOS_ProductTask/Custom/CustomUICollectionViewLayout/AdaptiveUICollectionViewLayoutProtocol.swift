//
//  AdaptiveUICollectionViewLayoutProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

protocol AdaptiveUICollectionViewLayoutProtocol: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}
