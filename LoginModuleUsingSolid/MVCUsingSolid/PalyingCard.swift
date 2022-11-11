//
//  PalyingCard.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 28/10/22.
//

import Foundation
import UIKit
class PlayingCard {
    var rank: RanksEnum
    var faceUp: Bool
    init(rank: RanksEnum, faceUp: Bool) {
        self.rank = rank
        self.faceUp = faceUp
    }

    func getRank() -> RanksEnum {
        return rank
    }
}
