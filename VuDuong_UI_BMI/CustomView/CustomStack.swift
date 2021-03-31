//
//  CustomStack.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 27/03/2021.
//

import UIKit

class CustomStack: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution  = UIStackView.Distribution.equalSpacing
        self.spacing = 5
        self.alignment = UIStackView.Alignment.center
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
