//
//  NewWordSubTVC.swift
//  Esimda | Essential English Words
//
//  Created by MacBook Pro on 18/09/23.
//

import UIKit

class NewWordSubTVC: UITableViewCell {

    
    @IBOutlet weak var wordTF: UITextField!
    
    
    @IBOutlet weak var descTF: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(word:WordsDM){
        wordTF.text = word.word
        descTF.text = word.desc
    }
    
}
