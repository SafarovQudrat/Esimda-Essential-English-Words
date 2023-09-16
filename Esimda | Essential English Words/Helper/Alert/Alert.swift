//
//  Alert.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import UIKit

let screenSize = UIScreen.main.bounds

class Alert: UIView {
    
    var completion: ((Bool) -> Void)?
    
    static let messageView = UIView()
    
    class func showAlert(title: String, completion: @escaping (Bool) -> Void) {
                
        //       backgroundView
        let backgroundView = Alert(frame: screenSize)
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549715638, green: 0.263189882, blue: 0.3012534678, alpha: 0.5)
        backgroundView.completion = completion
        backgroundView.tag = 27
        
        //       messageView
        Alert.messageView.backgroundColor = #colorLiteral(red: 0.9937880635, green: 0.9937880635, blue: 0.9937880635, alpha: 1)
        Alert.messageView.layer.cornerRadius = 10
        Alert.messageView.translatesAutoresizingMaskIntoConstraints = false
        
        //       titleLbl
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.numberOfLines = 0
        titleLbl.textColor = .black
        titleLbl.backgroundColor = .white
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.boldSystemFont(ofSize: 24)//UIFont(name: "roboto_bold", size: 24)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        //       acceptBtn
        let acceptBtn = UIButton()
        acceptBtn.layer.cornerRadius = 8
        acceptBtn.backgroundColor = .black
        acceptBtn.setTitle("Yes", for: .normal)
        acceptBtn.setTitleColor(UIColor.white, for: .normal)
        acceptBtn.titleLabel?.font = UIFont(name: "roboto_bold", size: 18)
        acceptBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //       cancelBtn
        let cancelBtn = UIButton()
        cancelBtn.backgroundColor = #colorLiteral(red: 0.9309120178, green: 0.934602797, blue: 0.9500084519, alpha: 1)
        cancelBtn.layer.cornerRadius = 8
        cancelBtn.setTitle("No", for: .normal)
        cancelBtn.setTitleColor(UIColor.darkGray, for: .normal)
        cancelBtn.titleLabel?.font = UIFont(name: "roboto_bold", size: 18)
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //       stackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        backgroundView.addSubview(Alert.messageView)
        
        Alert.messageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        Alert.messageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        Alert.messageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        Alert.messageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        
        Alert.messageView.addSubview(stackView)
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(acceptBtn)
        stackView.addArrangedSubview(cancelBtn)
        
        stackView.topAnchor.constraint(equalTo: Alert.messageView.topAnchor, constant: 30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: Alert.messageView.bottomAnchor, constant: -30).isActive = true
        stackView.leftAnchor.constraint(equalTo: Alert.messageView.leftAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: Alert.messageView.trailingAnchor, constant: -12).isActive = true
        
        acceptBtn.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        acceptBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        acceptBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        acceptBtn.addTarget(backgroundView, action: #selector(Alert.alertAcceptButtonTapped), for: .touchUpInside)
        
        cancelBtn.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        cancelBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        cancelBtn.addTarget(backgroundView, action: #selector(Alert.alertCancelButtonTapped), for: .touchUpInside)
        
        
        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(27) {
                vi.removeFromSuperview()
            }
            window.addSubview(backgroundView)
        }
        
        Alert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            Alert.messageView.transform = .identity
        } completion: { _ in }
        
    }
    
    @objc func alertCancelButtonTapped() {
        completion?(false)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            Alert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.2, delay: 0.6) {
            self.removeFromSuperView()
        }
        
    }
    
    @objc func alertAcceptButtonTapped() {
        completion?(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            Alert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.2, delay: 0.6) {
            self.removeFromSuperView()
        }
        
    }
    
    func removeFromSuperView() {
        self.removeFromSuperview()
    }
    
    
}
