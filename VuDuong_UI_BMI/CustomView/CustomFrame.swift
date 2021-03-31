//
//  CustomFrame.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 27/03/2021.
//

import UIKit

class CustomFrame: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.26, alpha: 1.00)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
