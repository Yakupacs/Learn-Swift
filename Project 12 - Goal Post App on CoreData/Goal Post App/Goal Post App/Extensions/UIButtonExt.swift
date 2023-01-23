//
//  UIButtonEXT.swift
//  Goal Post App
//
//  Created by Yakup on 1.01.2023.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = UIColorFromRGB(rgbValue: 0x6DBC63)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = UIColorFromRGB(rgbValue: 0xB2DDAF)
    }
    
}

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
