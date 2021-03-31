//
//  CustomHighLabel.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 27/03/2021.
//

import UIKit

class CustomHighLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.frame = CGRect(x: 0, y: 0, width: 300, height: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

