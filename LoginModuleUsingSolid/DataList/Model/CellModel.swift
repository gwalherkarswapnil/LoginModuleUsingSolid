//
//  CellModel.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 06/10/22.
//

import Foundation

enum Celltype {
    case product
    case add
    case none
}
struct CellModel {
    var type: Celltype = .none
}
