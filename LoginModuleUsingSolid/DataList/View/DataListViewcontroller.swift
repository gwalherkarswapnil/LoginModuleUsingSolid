//
//  DataListViewcontroller.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 06/10/22.
//

import Foundation
import UIKit
class DataListViewcontroller:UIViewController, UITableViewDataSource {
    var data = [CellModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = data[indexPath.row]
        let defaultCell = tableView.dequeueReusableCell(withIdentifier:"defaultCell" , for: indexPath)
        switch cellModel.type {
        case .product:
            guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else {return defaultCell }
            return productCell
        case .add:
            guard let AddCell = tableView.dequeueReusableCell(withIdentifier: AddCell.reuseID, for: indexPath) as? AddCell else {return defaultCell }
            return AddCell
        case .none:
            return defaultCell
            
        }
    }
    
}
