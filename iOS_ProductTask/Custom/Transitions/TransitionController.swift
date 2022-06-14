//
//  AnimationController.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

enum AnimationType {
    case present
    case dimiss
}

class TransitionController: NSObject {
    let duration: Double
    let type: AnimationType
    
    
    
    init(duration: Double, type: AnimationType) {
        self.duration = duration
        self.type = type
    }
}

extension TransitionController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: duration) ?? 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let destination = transitionContext.viewController(forKey: .to),
              let source = transitionContext.viewController(forKey: .from)
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        switch type {
        case .present:
            transitionContext.containerView.addSubview(destination.view)
            presentAnimation(transitionContext: transitionContext, animatedView: destination.view)
        case .dimiss:
            transitionContext.containerView.addSubview(destination.view)
            transitionContext.containerView.addSubview(source.view)
            dismissAnimation(transitionContext: transitionContext, animatedView: source.view)
        }
    }
    
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning,
                          animatedView: UIView) {
        let duration = transitionDuration(using: transitionContext)
        let scaleDown = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let moveOut = CGAffineTransform(translationX: -animatedView.frame.width, y: 0)

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
                animatedView.transform = scaleDown
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3.0 / duration, relativeDuration: 1) {
                animatedView.transform = scaleDown.concatenating(moveOut)
                animatedView.alpha = 0
            }

        } completion: { _ in
            transitionContext.completeTransition(true)
        }
   
    }
    
    
    func presentAnimation(transitionContext: UIViewControllerContextTransitioning,
                          animatedView: UIView) {
        
        animatedView.clipsToBounds = true
        animatedView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut) {
            animatedView.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
    
    
}
