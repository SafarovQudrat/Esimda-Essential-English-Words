//
//  Ex+NavigationBar.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func update(backroundColor: UIColor? = nil, titleColor: UIColor? = nil) {
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            if let backroundColor = backroundColor {
                appearance.backgroundColor = backroundColor
            }
            
            if let titleColor = titleColor {
                appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            }
            
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            
        } else {
            
            barStyle = .blackTranslucent
            
            if let backroundColor = backroundColor {
                barTintColor = backroundColor
            }
            
            if let titleColor = titleColor {
                titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
            }
            
        }
        
    }
    
}
