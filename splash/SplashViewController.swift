//
//  SplashViewController.swift
//  anime
//
//  Created by 1 on 2022/05/09.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            self.leadingConstraint.constant = -(self.imageView.frame.width - self.view.frame.width)
            self.view.layoutIfNeeded()
        } completion: { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
}

