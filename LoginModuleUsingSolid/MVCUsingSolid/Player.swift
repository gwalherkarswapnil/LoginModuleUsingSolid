//
//  Player.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 28/10/22.
//

import Foundation

class Player {
    var hand: Hand
    var name: String
    init(hand: Hand,name: String) {
        self.hand = hand
        self.name = name
    }
}


protocol P {
    func f()
}
class A : P {
    func f() {

    }
}

class B: A {
    override func f() {
    }

}
