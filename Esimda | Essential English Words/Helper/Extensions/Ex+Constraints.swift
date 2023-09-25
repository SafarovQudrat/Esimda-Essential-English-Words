//
//  Ex+Constraints.swift
//  Esimda | Essential English Words
//
//  Created by MacBook Pro on 25/09/23.
//

import UIKit


extension UIView {
    func topConst(view:UIView,equalTo:NSLayoutAnchor<NSLayoutYAxisAnchor>,top:CGFloat){
        view.topAnchor.constraint(equalTo: equalTo,constant: top).isActive = true
    }
    func leftConst(view:UIView,equalTo: NSLayoutAnchor<NSLayoutXAxisAnchor>,left:CGFloat){
        view.leftAnchor.constraint(equalTo: equalTo, constant: left)
    }
    func rightConst(view:UIView,equalTo:NSLayoutAnchor<NSLayoutXAxisAnchor>,right:CGFloat){
        view.trailingAnchor.constraint(equalTo: equalTo, constant: right)
    }
    func bottomConst(view:UIView,equalTo:NSLayoutAnchor<NSLayoutYAxisAnchor>,bottom:CGFloat){
        view.bottomAnchor.constraint(equalTo: equalTo,constant: bottom).isActive = true
    }
    func heightConst(view:UIView,height:CGFloat){
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    func widthConst(view:UIView,width:CGFloat) {
        view.widthAnchor.constraint(equalToConstant: width)
    }
    
    
}
