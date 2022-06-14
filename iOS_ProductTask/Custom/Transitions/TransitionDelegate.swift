//  Created by dasdom on 15.01.21.
//  
//

import UIKit

class TransitionDelegate: NSObject, UINavigationControllerDelegate {
  
  var interactiveTransition: UIPercentDrivenInteractiveTransition?
  
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
