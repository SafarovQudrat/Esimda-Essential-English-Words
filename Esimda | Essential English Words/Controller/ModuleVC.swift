//
//  ModuleVC.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 25/08/23.
//

import UIKit

class ModuleVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
        }
    }
    
    @IBOutlet weak var heightOfTableview: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var popRecognizer: InteractivePopRecognizer?
    
    var arrModules: [ModuleDM] = [
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: true),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ModuleDM(name: "Unit 1", desc: "The Lion and the Rabbit", img: "Essential_1", checkMarkIsHidden: false, isLearned: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setNavigation()
        scrollView.isHidden = arrModules.isEmpty ? true : false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Essential 1"
    }
    
    func setNavigation() {
        let backBtn = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backTapped))
        backBtn.tintColor = .black
        navigationItem.leftBarButtonItem = backBtn
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: false)
    }

    private func setInteractiveRecognizer() {
        guard let controller = navigationController else { return }
        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
    }


}

//MARK: - UITableViewDelegate
extension ModuleVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ModuleVC.nib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UITableViewDataSource
extension ModuleVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrModules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let heightOfTableview = 100*arrModules.count+45
        self.heightOfTableview.constant = CGFloat(heightOfTableview)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath) as? HomeTVC else { return UITableViewCell() }
        
            cell.updateCell(module: arrModules[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
