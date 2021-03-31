//
//  CustomLabel.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 27/03/2021.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.font.withSize(20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
