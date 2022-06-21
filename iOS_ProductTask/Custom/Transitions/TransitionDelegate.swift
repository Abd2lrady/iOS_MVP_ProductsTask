//
//  TransitionDelegate.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class TransitionDelegate: NSObject, UINavigationControllerDelegate {
  
  func navigationController(_ navigationController: UINavigationController,
                            animationControllerFor operation: UINavigationController.Operation,
                            from sourceVC: UIViewController,
                            to destinationVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      switch operation {
      case .push:
          return TransitionController(duration: 3.5, type: .present)
      case .pop:
          return TransitionController(duration: 3.5, type: .dimiss)
      default:
          return nil
      }
  }
}
