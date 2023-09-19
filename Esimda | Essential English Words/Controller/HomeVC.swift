//
//  HomeVC.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 23/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            collectionView.register(ModuleCVC.nib(), forCellWithReuseIdentifier: ModuleCVC.identifier)
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
        }
    }
    @IBOutlet weak var heightOfTableView: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewSecond: UITableView! {
        didSet {
            tableViewSecond.delegate = self
            tableViewSecond.dataSource = self
            tableViewSecond.separatorStyle = .none
            tableViewSecond.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
        }
    }
    
    @IBOutlet weak var heightOfTBSecond: NSLayoutConstraint!
    
    @IBOutlet weak var mainLangLbl: UILabel!
    
    @IBOutlet weak var translateLangLbl: UILabel!
    
    
    var arrModuleDM: [[ModuleDM]] = [
        [
            ModuleDM(name: "Units | Essential 1", desc: "Table of contents | 1-30", img: "Essential_1", checkMarkIsHidden: false, isLearned: true),
            ModuleDM(name: "Mening lug'atlarim", desc: "Siz kiritgan lug'atlar", img: "myWords", checkMarkIsHidden: false, isLearned: false)
        ],
        [
            ModuleDM(name: "Units | Essential 1", desc: "Table of contents | 1-30", img: "Essential_1", checkMarkIsHidden: true, isLearned: true),
            ModuleDM(name: "Mening lug'atlarim", desc: "Siz kiritgan lug'atlar", img: "myWords", checkMarkIsHidden: true, isLearned: false),
            ModuleDM(name: "Murakkab so'zlar", desc: "Tez-tez yodingizdan chiqayotgan murakkab so'zlar", img: "difficultWordsModule", checkMarkIsHidden: true, isLearned: false),
            ModuleDM(name: "Takrorlash", desc: "Yodlagan mavzularingiz yuzasidan takrorlash", img: "repeat", checkMarkIsHidden: true, isLearned: false)
        ]
    ]
    
    var arrCollectionView: [ModuleNameDM] = [
        ModuleNameDM(name: "", backColor: .tBlue),
        ModuleNameDM(name: "Unit 1", backColor: .tBlue),
        ModuleNameDM(name: "Unit 2", backColor: .white),
        ModuleNameDM(name: "Unit 3", backColor: .white),
        ModuleNameDM(name: "Unit 4", backColor: .white),
        ModuleNameDM(name: "Unit 5", backColor: .white),
        ModuleNameDM(name: "Unit 6", backColor: .white),
        ModuleNameDM(name: "Unit 7", backColor: .white),
        ModuleNameDM(name: "Unit 8", backColor: .white),
        ModuleNameDM(name: "Unit 9", backColor: .white),
        ModuleNameDM(name: "Unit 10", backColor: .white),
        ModuleNameDM(name: "Unit 11", backColor: .white),
        ModuleNameDM(name: "Unit 12", backColor: .white),
        ModuleNameDM(name: "Unit 13", backColor: .white),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if arrCollectionView.count != 1 {
            arrCollectionView.removeFirst()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func changeLangTapped(_ sender: Any) {
        if mainLangLbl.text == "en" {
            mainLangLbl.text = "uz"
            translateLangLbl.text = "en"
        } else {
            mainLangLbl.text = "en"
            translateLangLbl.text = "uz"
        }
    }
    

}

//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            for i in 0...arrModuleDM[0].count-1 {
                arrModuleDM[0][i].isLearned = false
            }
            arrModuleDM[0][indexPath.row].isLearned = true
        } else {
            
            if indexPath.row == 0 {
                let vc = ModuleVC(nibName: "ModuleVC", bundle: nil)
                self.navigationItem.backButtonTitle = ""
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.row == 1 {
                let vc = MyWordsVC(nibName: "MyWordsVC", bundle: nil)
                self.navigationItem.backButtonTitle = ""
                self.navigationController?.pushViewController(vc, animated: true)
            }
                
            
        }
        
        
        
        
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: -10, y: 0, width: tableView.frame.size.width, height: 30))
        label.font = UIFont(name: "inter_semiBold", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "    Kartalarda aks etadi:"
        return tableView == self.tableView ?  label : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView == self.tableView ? 30 : 0
    }
    
}

//MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.tableView ? arrModuleDM[0].count : arrModuleDM[1].count
//        return arrModuleDM[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let heightOfTableView = 100*arrModuleDM[0].count+80
        let heightOfTableViewSecond = 100*arrModuleDM[1].count+45
        self.heightOfTableView.constant = CGFloat(heightOfTableView)
        self.heightOfTBSecond.constant = CGFloat(heightOfTableViewSecond)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath) as? HomeTVC else { return UITableViewCell() }
        
        if tableView == self.tableView {
            cell.updateCell(module: arrModuleDM[0][indexPath.row])
        } else {
            cell.updateCell(module: arrModuleDM[1][indexPath.row])
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

//MARK: - UICollectionViewDelegate
extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0...arrCollectionView.count-1 {
            arrCollectionView[i].backColor = .white
        }
        arrCollectionView[indexPath.item].backColor = .tBlue
        collectionView.reloadData()
    }
    
}

//MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ModuleCVC.identifier, for: indexPath) as? ModuleCVC else { return UICollectionViewCell() }
        
        if arrCollectionView.first?.name == "" {
            cell.updateCell(module: arrCollectionView[indexPath.item], isEmpty: false)
        } else {
            cell.updateCell(module: arrCollectionView[indexPath.item], isEmpty: true)
        }
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemW = arrCollectionView[indexPath.row].name.widthOfString(usingFont: UIFont.systemFont(ofSize: 22, weight: .semibold)) + 40
        
//        let itemH = arrCollectionView[indexPath.row].name.heightOfString(usingFont: UIFont.systemFont(ofSize: 16, weight: .semibold)) + 20
        
        return CGSize(width: itemW, height: 55)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
