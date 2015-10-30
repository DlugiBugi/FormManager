//
//  FormManager.swift
//  FormManagerDemo
//
//  Created by Jakub Długosz on 30.10.2015.
//  Copyright © 2015 Jakub Długosz. All rights reserved.
//

import UIKit

public class FormManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView
    var dataSource: [(BaseFormCell.Type,AnyObject)]? = []
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    public func addBulk<T: AnyObject>(array: [(data: T, cellType: FormCell<T>.Type)]) {
        for (d,t) in array {
            addData(d, cellType: t)
        }
    }
    
    public func addData<T: AnyObject>(data: T, cellType: FormCell<T>.Type) {
        dataSource?.append((cellType,data))
    }
    
    //MARK: UITableViewDataSource
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let unwrappedArray = dataSource else {
            return 0
        }
        
        return unwrappedArray.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let (type,data) = dataSource?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let typeString = String(type)

        var cell = tableView.dequeueReusableCellWithIdentifier(typeString)
        if cell == nil {
            tableView.registerNib(UINib(nibName: typeString, bundle: nil), forCellReuseIdentifier: typeString)
            cell = tableView.dequeueReusableCellWithIdentifier(typeString)
        }
    
        let baseCell = cell as! BaseFormCell
        
        baseCell.baseFillWithData(data)
        
        return baseCell
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard let (type,data) = dataSource?[indexPath.row] else {
            return 0
        }
        return type.baseHeightForData(data)
    }
}
