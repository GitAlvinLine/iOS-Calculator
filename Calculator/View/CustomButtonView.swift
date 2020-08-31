//
//  CustomButtonView.swift
//  Calculator
//
//  Created by Alvin Escobar on 8/8/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class CustomButtonView: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth = 10.0
        self.layer.cornerRadius = 30.0
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
