//
//  Extension.swift
//  Netflix Clone
//
//  Created by aykut ipek on 2.02.2023.
//

import UIKit

extension UIViewController {
    func configureBackgroundColor(){
        view.backgroundColor = .systemBackground
    }
}

extension UIView {
    func addGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor , UIColor.systemBackground.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

extension String{
    func capitalizeFirstLatter()-> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
