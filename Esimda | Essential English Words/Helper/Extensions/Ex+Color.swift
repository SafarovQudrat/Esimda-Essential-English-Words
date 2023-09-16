//
//  Ex+Color.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import Foundation
import UIKit


extension UIColor {
    
    static let tBlue: UIColor = UIColor(named: "tBlue") ?? .blue
    
    static let tGray1: UIColor = UIColor(named: "tGray1") ?? .gray
    
    static let tGray2: UIColor = UIColor(named: "tGray2") ?? .lightGray
    
    static let tGreen: UIColor = UIColor(named: "tGreen") ?? .green
    
    static let tGreenPuzzle: UIColor = UIColor(named: "tGreenPuzzle") ?? .green
    
    static let tLightBlue: UIColor = UIColor(named: "tLightBlue") ?? .blue
    
    static let tRedPuzzle: UIColor = UIColor(named: "tRedPuzzle") ?? .red
    
    
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    
}
