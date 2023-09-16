//
//  HomeTVC.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 24/08/23.
//

import UIKit

class HomeTVC: UITableViewCell {
    
    @IBOutlet weak var moduleImg: UIImageView!
    
    @IBOutlet weak var moduleNameLbl: UILabel!
    
    @IBOutlet weak var moduleDescLbl: UILabel!
    
    @IBOutlet weak var checkMarkView: UIView!
    
    @IBOutlet weak var checkMarkImg: UIImageView!
    
    
    static func nib() -> UINib {
        UINib(nibName: "HomeTVC", bundle: nil)
    }
    
    static let identifier: String = "HomeTVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateCell(module: ModuleDM) {
        
        checkMarkImg.image = module.isLearned ? UIImage(named: "checkMark_Done") : UIImage(named: "checkMark")
        checkMarkView.isHidden = module.checkMarkIsHidden
        moduleImg.image = UIImage(named: module.img)
        moduleNameLbl.text = module.name
        moduleDescLbl.text = module.desc
        
    }
    
    @IBAction func checkMarkTapped(_ sender: Any) {
    }
    
}
