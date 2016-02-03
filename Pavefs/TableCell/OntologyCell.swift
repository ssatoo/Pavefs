//
//  OntologyCell.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 25/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

class OntologyCell: UITableViewCell {

    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var nextChildrenImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
