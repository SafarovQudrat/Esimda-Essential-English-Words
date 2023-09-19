//
//  MyWordsVC.swift
//  Esimda | Essential English Words
//
//  Created by MacBook Pro on 18/09/23.
//

import UIKit

class MyWordsVC: UIViewController {

    
    @IBOutlet weak var tableVIew: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavController()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: "HomeTVC", bundle: nil), forCellReuseIdentifier: "HomeTVC")
    }

//------------Set Nav Controller
    func setNavController(){
        self.navigationController?.navigationBar.update(backroundColor: .white)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "My Words"
        let backBtn = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backTapped))
        backBtn.tintColor = .black
        navigationItem.leftBarButtonItem = backBtn
        
        let plusBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(plusTapped))
        plusBtn.tintColor = .black
        navigationItem.rightBarButtonItem = plusBtn
    }

    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func plusTapped(){
        let vc = AddNewMyWord(nibName: "AddNewMyWord", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension MyWordsVC:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: " ") { _, _, _ in
            Alert.showAlert(title: "Are you sure you want to delete the  module?") { isTapped in
                
            }
            
        }
        delete.image = UIImage(systemName: "trash")
        
        let archive = UIContextualAction(style: .normal, title: "Archive") { _, _, _ in}
        archive.image = UIImage(systemName: "archivebox.fill")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as? HomeTVC else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
}
