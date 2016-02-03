//
//  QueryCell.swift
//  Pavefs
//
//  Created by Zacharias Yiakoumi on 20/11/15.
//  Copyright © 2015 Nayeye. All rights reserved.
//

import UIKit

protocol QueryCellBtns
{
    func showButtonTapped(btntag:Int)
    func statusButtonTapped(btntag:Int)
}


class QueryCell: UITableViewCell {
    
     var delegate: QueryCellBtns?
    @IBOutlet weak var lblNametitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCreatedTitle: UILabel!
    @IBOutlet weak var lblCreated: UILabel!
    @IBOutlet weak var cellview: UIView!
    
    @IBOutlet weak var TickGreenticke: UIImageView!
    @IBOutlet weak var ShowArrowImg: UIImageView!
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var ArrowImg: UIImageView!
    @IBOutlet var btnStatus: UIButton!
    @IBOutlet var btnShow: UIButton!
    @IBAction func Show_Action(sender: AnyObject) {
        print("Show_Action")
        let btn:UIButton =  sender as! UIButton
        print(btn.tag)
        delegate?.showButtonTapped(btn.tag)
    }

    @IBAction func status_Action(sender: AnyObject) {
        print("status_Action")
        let btn:UIButton =  sender as! UIButton
        print(btn.tag)
        
        delegate?.statusButtonTapped(btn.tag)
        
    }
}
