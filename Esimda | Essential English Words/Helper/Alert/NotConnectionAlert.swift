//
//  NotConnectionAlert.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import UIKit

class NetConnectionAlert: UIView {
    
    var completion: ((Bool) -> Void)?
    
    static let messageView = UIView()
    
    class func showAlert(title: String, message: String, completion: @escaping (Bool) -> Void) {
        
        //       backgroundView
        let backgroundView = NetConnectionAlert(frame: screenSize)
        backgroundView.backgroundColor = #colorLiteral(red: 0.2549715638, green: 0.263189882, blue: 0.3012534678, alpha: 0.5)
        backgroundView.completion = completion
        backgroundView.tag = 2727
        
        
        //       messageView
        NetConnectionAlert.messageView.backgroundColor = #colorLiteral(red: 0.9937880635, green: 0.9937880635, blue: 0.9937880635, alpha: 1)
        NetConnectionAlert.messageView.layer.cornerRadius = 10
        NetConnectionAlert.messageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        //       cancelBtn
        let settingsBtn = UIButton()
        settingsBtn.backgroundColor = #colorLiteral(red: 0.9309120178, green: 0.934602797, blue: 0.9500084519, alpha: 1)
        settingsBtn.layer.cornerRadius = 8
        settingsBtn.setTitle("Settings", for: .normal)
        settingsBtn.setTitleColor(UIColor.gray, for: .normal)
        settingsBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        settingsBtn.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        
        backgroundView.addSubview(NetConnectionAlert.messageView)
        
        NetConnectionAlert.messageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        NetConnectionAlert.messageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        NetConnectionAlert.messageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        NetConnectionAlert.messageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        
        ///vStackView
        NetConnectionAlert.messageView.addSubview(vStackView)
        vStackView.addArrangedSubview(titleLbl)
        vStackView.addArrangedSubview(messageLbl)
        vStackView.addArrangedSubview(hStackView)
        
        hStackView.addArrangedSubview(acceptBtn)
        hStackView.addArrangedSubview(settingsBtn)
        
        vStackView.topAnchor.constraint(equalTo: NetConnectionAlert.messageView.topAnchor, constant: 30).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: NetConnectionAlert.messageView.bottomAnchor, constant: -30).isActive = true
        vStackView.leftAnchor.constraint(equalTo: NetConnectionAlert.messageView.leftAnchor, constant: 12).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: NetConnectionAlert.messageView.trailingAnchor, constant: -12).isActive = true
        
        ///hStackView
        hStackView.leftAnchor.constraint(equalTo: vStackView.leftAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 0).isActive = true
        
        ///acceptBtn
        acceptBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        acceptBtn.addTarget(backgroundView, action: #selector(NetConnectionAlert.alertAcceptButtonTapped), for: .touchUpInside)
        
        ///settingsBtn
        settingsBtn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        settingsBtn.addTarget(backgroundView, action: #selector(NetConnectionAlert.alertSettingsButtonTapped), for: .touchUpInside)
        
        
        if let window = UIApplication.shared.keyWindow {
            if let vi = UIApplication.shared.keyWindow?.viewWithTag(2727) {
                vi.removeFromSuperview()
            }
            window.addSubview(backgroundView)
        }
        
        NetConnectionAlert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseOut]) {
            NetConnectionAlert.messageView.transform = .identity
        } completion: { _ in }
        
    }
    
    @objc func alertSettingsButtonTapped() {
        completion?(false)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            NetConnectionAlert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.2, delay: 0.6) {
            self.removeFromSuperView()
        }
        
        let url = URL(string: "App-Prefs:root=WIFI") //for WIFI setting app
        let app = UIApplication.shared
        app.openURL(url!)
        
    }
    
    @objc func alertAcceptButtonTapped() {
        completion?(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [.curveEaseIn]) {
            NetConnectionAlert.messageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.2, delay: 0.6) {
            self.removeFromSuperView()
        }
        
    }
    
    func removeFromSuperView() {
        self.removeFromSuperview()
    }
    
    
}
