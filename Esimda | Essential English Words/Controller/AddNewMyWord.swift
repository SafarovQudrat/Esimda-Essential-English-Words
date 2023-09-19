//
//  AddNewMyWord.swift
//  Esimda | Essential English Words
//
//  Created by MacBook Pro on 18/09/23.
//

import UIKit

class AddNewMyWord: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var descTF: UITextField!
    
    @IBOutlet weak var descBtn: UIButton!
    
    @IBOutlet weak var descV: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
var count = 4
    override func viewDidLoad() {
        super.viewDidLoad()
setNavController()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewWordSubTVC", bundle: nil), forCellReuseIdentifier: "NewWordSubTVC")
        tableViewHeight.constant = CGFloat(count * 183)
        
    }


    func setNavController(){
        navigationController?.navigationBar.update(backroundColor: .white)
        navigationItem.title = "New Word"
        let backBtn = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backTapped))
        backBtn.tintColor = .black
        navigationItem.leftBarButtonItem = backBtn
        
        let tickBtn = UIBarButtonItem(image: UIImage(named: "tick"), style: .done, target: self, action: #selector(tickTapped))
        navigationItem.rightBarButtonItem = tickBtn
        nameTF.attributedPlaceholder = NSAttributedString(string: "Subject, chapter, section",attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6078431373, green: 0.7254901961, blue: 0.9764705882, alpha: 1)])
        descTF.attributedPlaceholder = NSAttributedString(string: "What is this training module about?",attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6078431373, green: 0.7254901961, blue: 0.9764705882, alpha: 1)])
        descV.isHidden = true
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tickTapped(){
        
    }
    
    @IBAction func descBtnTapped(_ sender: Any) {
        descV.isHidden = false
        descBtn.isHidden = true
    }
    
}
extension AddNewMyWord:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewWordSubTVC", for: indexPath) as? NewWordSubTVC else {return UITableViewCell()}
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}
