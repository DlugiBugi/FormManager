//
//  ViewController.swift
//  FormManager
//
//  Created by Jakub Długosz on 10/30/2015.
//  Copyright (c) 2015 Jakub Długosz. All rights reserved.
//

import UIKit
import FormManager
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var formManager: FormManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formManager = FormManager(tableView: tableView)
        
        formManager.addData(NSString(string: "row1"), cellType: CustomCell.self)
        formManager.addData(NSString(string: "row2"), cellType: CustomCell.self)
        formManager.addData(NSString(string: "row3"), cellType: CustomCell.self)
        formManager.addData(NSString(string: "row4"), cellType: CustomCell.self)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

