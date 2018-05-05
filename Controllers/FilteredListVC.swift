//
//  FilteredListVC.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit

class FilteredListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var filterdTable: UITableView!
    var filteredData = [ServerData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: FilterdCell = filterdTable!.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FilterdCell{
            let list = self.filteredData[indexPath.row]
            cell.updateViews(serverData: list)
            return cell
        }
        else{
            return FilterdCell()
        }
    }
    



}
