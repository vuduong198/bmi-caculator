//
//  CustomPlusButton.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 27/03/2021.
//

import UIKit

class CustomPlusButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame : frame)
        self.layer.cornerRadius = 5
//        self.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.imageView?.contentMode = .scaleAspectFit
        self.setImage(UIImage(named: "plus"), for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
