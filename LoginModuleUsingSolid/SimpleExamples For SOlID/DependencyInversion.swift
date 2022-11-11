//
//  DependencyInversion.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 01/11/22.
//

import Foundation
protocol Receiver
{
    func receiveThis()
}

class Sender
{
    private var receiver: Receiver

    init(r: Receiver)
    {
        receiver = r
    }

    func doSomething()
    {
        receiver.receiveThis()
    }
}
