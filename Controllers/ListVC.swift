//
//  ListVC.swift
//  Assignment
//
//  Created by mahmoud farid on 5/3/18.
//  Copyright © 2018 mahmoud farid. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var filterBtn: UIButton!
    var data = [ServerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
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
    }

}
