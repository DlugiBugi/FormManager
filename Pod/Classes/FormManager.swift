//
//  FormManager.swift
//  FormManagerDemo
//
//  Created by Jakub Długosz on 30.10.2015.
//  Copyright © 2015 Jakub Długosz. All rights reserved.
//

import UIKit

public class FormManager: NSObject, UITableViewDataSource, UITableViewDelegate, BaseFormCellDelegate {
    private let tableView: UITableView
    var dataSource: [(BaseFormCell.Type,AnyObject)] = []
    
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
        dataSource.append((cellType,data))
    }
    
    public func clearData(){
        dataSource = []
    }
    
    //MARK: - Private
    
    
    //MARK: - UITableViewDataSource
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let (type,data) = dataSource[indexPath.row]
        
        let typeString = String(type)
        
        var cell = tableView.dequeueReusableCellWithIdentifier(typeString)
        if cell == nil {
            
            let nib = UINib(nibName: typeString, bundle: nil)
            tableView.registerNib(nib, forCellReuseIdentifier: typeString)
            cell = tableView.dequeueReusableCellWithIdentifier(typeString)
        }
        
        let baseCell = cell as! BaseFormCell
        baseCell.delegate = self
        baseCell.baseFillWithData(data)
        
        return baseCell
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let (type,data) = dataSource[indexPath.row]
        return type.baseHeightForData(data)
    }
    
    //MARK: - BaseFormCellDelegate
    
    public func cellDidEndEdit(cell: BaseFormCell) {
        if let indexPath = tableView.indexPathForCell(cell) {
            if indexPath.row < dataSource.count-1 {
                let newCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)) as! BaseFormCell
                newCell.startEdit()
            } else {
                // just dismiss for now
            }
        }
    }
}
