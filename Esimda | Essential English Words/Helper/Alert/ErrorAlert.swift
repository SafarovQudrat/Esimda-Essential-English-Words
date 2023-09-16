//
//  ErrorAlert.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import UIKit

class ErrorAlert: UIView {
    
    var completion: ((Bool) -> Void)?
    
    static let messageView = UIView()
    
    class func showAlert(title: String, message: String, completion: @escaping (Bool) -> Void) {
                
        //       backgroundView
        let backgroundView = ErrorAlert(frame: screenSize)
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549715638, green: 0.263189882, blue: 0.3012534678, alpha: 0.5)
        backgroundView.completion = completion
        backgroundView.tag = 21072023
        
        //       messageView
        ErrorAlert.messageView.backgroundColor = #colorLiteral(red: 0.9937880635, green: 0.9937880635, blue: 0.9937880635, alpha: 1)
        ErrorAlert.messageView.layer.cornerRadius = 10
        ErrorAlert.messageView.translatesAutoresizingMaskIntoConstraints = false
        
        //       titleLbl
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.numberOfLines = 0
        titleLbl.textColor = .black
        titleLbl.backgroundColor = .white
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.boldSystemFont(ofSize: 24)//UIFont(name: "roboto_bold", size: 24)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //       messageLbl
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.numberOfLines = 0
        messageLbl.textColor = .black
        messageLbl.backgroundColor = .white
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont.systemFont(ofSize: 20)//UIFont(name: "roboto_bold", size: 24)
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //       acceptBtn
        let acceptBtn = UIButton()
        acceptBtn.layer.cornerRadius = 8
        acceptBtn.backgroundColor = .tBlue
        acceptBtn.setTitle("Ok", for: .normal)
        acceptBtn.setTitleColor(UIColor.white, for: .normal)
        acceptBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        acceptBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //       vertical stackView
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.alignment = .center
        vStackView.distribution = .fill
        vStackView.spacing = 10
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //       horizontal stackView
        let hStackView = UIStackView()
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.distribution = .fillEqually
        hStackView.spacing = 20
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        backgroundView.addSubview(ErrorAlert.messageView)
        
        ErrorAlert.messageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        ErrorAlert.messageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        ErrorAlert.messageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        ErrorAlert.messageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        
        ErrorAlert.messageView.addSubview(vStackView)
        vStackView.addArrangedSubview(titleLbl)
        vStackView.addArrangedSubview(messageLbl)
        vStackView.addArrangedSubview(hStackView)
        
        hStackView.addArrangedSubview(acceptBtn)
        
        ///vStackView
        vStackView.topAnchor.constraint(equalTo: ErrorAlert.messageView.topAnchor, constant: 30).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: ErrorAlert.messageView.bottomAnchor, constant: -30).isActive = true
        vStackView.leftAnchor.constraint(equalTo: ErrorAlert.messageView.leftAnchor, constant: 12).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: ErrorAlert.messageView.trailingAnchor, constant: -12).isActive = true
        
        ///messageLbl
        messageLbl.leftAnchor.constraint(equalTo: vStackView.leftAnchor, constant: 20).isActive = true
        messageLbl.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: -20).isActive = true
        
        ///titleLbl
        titleLbl.leftAnchor.constraint(equalTo: vStackView.leftAnchor, constant: 30).isActive = true
        titleLbl.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: -30).isActive = true
        
        ///hStackView
        hStackView.leftAnchor.constraint(equalTo: vStackView.leftAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 0).isActive = true
        
        ///acceptBtn
        acceptBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        acceptBtn.addTarget(backgroundView, action: #selector(ErrorAlert.alertAcceptButtonTapped), for: .touchUpInside)
        
        
//        if let window = UIWindow.keyWindow {
//            if let vi = window.viewWithTag(21072023) {
//                vi.removeFromSuperview()
//            }
//            window.addSubview(backgroundView)
//        }
        
        ErrorAlert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            ErrorAlert.messageView.transform = .identity
        } completion: { _ in }
        
    }
    
    @objc func alertAcceptButtonTapped() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            ErrorAlert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.2, delay: 0.6) {
//            self.removeFromSuperView()
            
        }
        
        completion?(true)
        
    }
    
//    func removeFromSuperView() {
//        if let window = UIWindow.keyWindow {
//            if let view = window.viewWithTag(21072023) {
//                ErrorAlert.messageView.removeFromSuperview()
//                view.removeFromSuperview()
//            }
//        }
//    }
    
    
}
