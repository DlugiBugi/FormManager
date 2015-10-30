//
//  CustomCell.swift
//  FormManager
//
//  Created by Jakub Długosz on 30.10.2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import FormManager

class CustomCell: FormCell<NSString> {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func fillWithData(data: NSString) {
        titleLabel.text = String(data)
    }
    
    override class func heightForData(data: NSString) -> CGFloat {
        return 24.0
    }
}
