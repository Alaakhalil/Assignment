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
        self.filterBtn.isEnabled = false
        self.filterBtn.alpha = 0.5
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
        }
        

    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let item = data[indexPath.row]
    if self.selectedRows.contains(item){
        self.selectedRows.remove(at: self.selectedRows.index(of: item)!)
    }
    else
    {
        self.selectedRows.append(item)
    }
    if selectedRows.count > 9{
        self.filterBtn.isEnabled = false
        self.filterBtn.alpha = 0.5
        let alertMassage = UIAlertController(title: "warnnig", message: "You can't select more then 10 items", preferredStyle: UIAlertControllerStyle.alert)
        alertMassage.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertMassage, animated: true, completion: nil)
    }
    else if selectedRows.count == 0
    {
        self.filterBtn.isEnabled = false
        self.filterBtn.alpha = 0.5
    }
    else
    {
        self.filterBtn.isEnabled = true
        self.filterBtn.alpha = 1
    }
        item.selected = !item.selected!
        self.listTable.reloadData()
}
    @IBAction func filterBtnPressed(_ sender: Any) {

        performSegue(withIdentifier: "Filter", sender: Any?.self)
    }
    

}
