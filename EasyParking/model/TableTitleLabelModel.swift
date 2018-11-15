//
//  TableTitleLabelModel.swift
//  EasyParking
//
//  Created by Carlos Jose Bulado on 2018-11-02.
//  Copyright © 2018 Carlos Jose Bulado. All rights reserved.
//

import Foundation
import UIKit

class TableTitleLabelModel
{
    var title : String?
    var label : String?
    
    init() { }
    
    init(_ title : String?, _ label : String?)
    {
        self.title = title
        self.label = label
    }
    
    static func CreateCell(_ tableView : UITableView, cellForRowAt indexPath : IndexPath, cellIdentifier : String, arrayInfo : [TableTitleLabelModel]) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = arrayInfo[indexPath.row].title
        cell.detailTextLabel?.text = arrayInfo[indexPath.row].label
        
        return cell;
    }
}
