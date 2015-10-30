//
//  FormCell.swift
//  FormManagerDemo
//
//  Created by Jakub Długosz on 30.10.2015.
//  Copyright © 2015 Jakub Długosz. All rights reserved.
//

import UIKit

public class BaseFormCell : UITableViewCell {
    
    public required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func baseFillWithData(data: AnyObject) {
        print("BaseFormCell fillWithData")
    }
    
    class func baseHeightForData(data: AnyObject) ->CGFloat {
        return 44.0
    }
    
}

public class FormCell<TData: AnyObject>: BaseFormCell {

    public required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func baseFillWithData(data: AnyObject) {
        self.fillWithData(data as! TData)
    }
    
    override class func baseHeightForData(data: AnyObject) ->CGFloat {
        return self.heightForData(data as! TData)
    }
    
    public func fillWithData(data: TData) {
        print("FormCell<TData: AnyObject> fillWithData")
    }
    
    public class func heightForData(data: TData) -> CGFloat {
        return 44.0
    }

}
