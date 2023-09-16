//
//  ModuleCVC.swift
//  Esimda | Essential English Words
//
//  Created by O'ral Nabiyev on 24/08/23.
//

import UIKit

class ModuleCVC: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var nameModuleLbl: UILabel!
    
    @IBOutlet weak var plusImg: UIImageView!
    
    static func nib() -> UINib {
        UINib(nibName: "ModuleCVC", bundle: nil)
    }
    
    static let identifier: String = "ModuleCVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(module: ModuleNameDM, isEmpty: Bool = true) {
        backView.backgroundColor = module.backColor
        nameModuleLbl.text = module.name
        plusImg.isHidden = isEmpty
        
        if !isEmpty {
            backView.backgroundColor = .tBlue
        }
        
        if module.backColor == UIColor.tBlue {
            nameModuleLbl.textColor = .white
        } else {
            nameModuleLbl.textColor = .black
        }
    }

}
