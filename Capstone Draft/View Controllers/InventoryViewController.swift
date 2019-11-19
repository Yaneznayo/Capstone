//
//  InventoryViewController.swift
//  Capstone Draft
//
//  Created by Christopher Pung on 10/18/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

/*
 data comes from Item Struct
 1 connect the tableview using an IBOutlet
 2 set viewcontroller as datasource for tableview in viewdidload
 3 use an extension on the InventoryViewController and conform to UITableViewDataSource
 4 implement required methods
 */

class InventoryViewController: UIViewController {
    // 1
    @IBOutlet var tableView: UITableView!
    var myEquipment = ["Shirt", "Shorts", "Helmet", "Gloves", "Pauldrons"]
    var equipment: [EquipItemModel] = []
    var consumables: [ConsumableItemModel] = []
    var materials: [MaterialItemModel] = []
    var sections = ["Equipment", "Consumable", "Material"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    //for fred in myEquipment{
        // do work in InventorySetup to create an array of instances of EquipItemModel
        // append finished struct to equipment
        // call EquipItemModel
    //}
}

// 3
extension InventoryViewController: UITableViewDataSource {
   
    //4
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        return section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row+1)"
        return cell
    }
}
