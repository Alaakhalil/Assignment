//
//  ListVC.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit
import UICheckbox_Swift

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var filterBtn: RoundedButton!
    var data = [ServerData]()
    var selectedRows = [ServerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getList()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterBtn.isTouchInside{
            return selectedRows.count
        }
        else{
        return data.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: ListCell = listTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell{
            let list = self.data[indexPath.row]
            cell.updateViews(serverData: list)
           return cell
        }
        else{
            return ListCell()
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barItem = UIBarButtonItem()
        barItem.title = ""
        navigationItem.backBarButtonItem = barItem
        if segue.identifier == "Filter"{
            let vc = segue.destination as! FilteredListVC
            print(selectedRows.count)
            vc.filteredData = self.selectedRows
        }
    }

   
    func getList(){
        
        DispatchQueue.main.async {
            
            Network.instance.fetchData { (response, error) in
                if error != nil{
                    print(error!)
                }
                else{
                    let res = response.result.value!
                    for item in res{
                        self.data.append(item)
                    }
                    
                    self.listTable.reloadData()
                }
            }
            self.listTable.allowsMultipleSelection = true
        }
        

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.selectedRows.append(self.data[indexPath.row])
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        for value in selectedRows {
            if item.title == value.title {
                selectedRows =  selectedRows.filter() { $0 !== value }
            }
        }
    }
    @IBAction func filterBtnPressed(_ sender: Any) {

        performSegue(withIdentifier: "Filter", sender: Any?.self)
//        self.listTable.reloadData()
//        navigationItem.title = "Filtered"
//        listTable.allowsMultipleSelectionDuringEditing = false
//        listTable.setEditing(false, animated: false)
    }
    

}
