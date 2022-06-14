//
//  ProductDetailsVC+TransitioningDelegate.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension ProductDetailsVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionController(duration: 2.5, type: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionController(duration: 3.5, type: .dimiss)
    }
}
