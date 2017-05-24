////
////  myTransitionlalalal.swift
////  The Shards of the Infinite
////
////  Created by Mobile on 5/15/17.
////  Copyright © 2017 SBHS. All rights reserved.
////
//
import UIKit
//
class SegueFromLeft: UIStoryboardSegue{
    override func perform(){
        let src = source
        let dst = destination
        let slide_view = destination.view
        
        src.view.addSubview(slide_view!)
//        slide_view?.transform=CGAffineTransform.init(translationX: src.view.frame.size.width, 0)
//        slide_view?.transform = CGAffineTransform.init(rotationAngle: 0)
        slide_view?.transform = CGAffineTransform.init(translationX: 500, y: 0)
        
        UIView.animate(withDuration: 0.3,
                                   delay: 0,
                                   options: UIViewAnimationOptions.curveLinear,
                                   animations: {
                                    slide_view?.transform = CGAffineTransform.identity
            }, completion: {finished in
                src.present(dst, animated: false, completion: nil)
                slide_view?.removeFromSuperview()
        })
    }
}
