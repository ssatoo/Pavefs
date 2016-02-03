//
//  ChildCell.swift
//  ClaimAll
//


import UIKit

class ChildCell: UITableViewCell {
    
    @IBOutlet weak var lblChildNAmeTitle: UILabel!
    @IBOutlet weak var lblChildName: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblChildSex: UILabel!
    @IBOutlet weak var lbChldSexTitle: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var arrowImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
