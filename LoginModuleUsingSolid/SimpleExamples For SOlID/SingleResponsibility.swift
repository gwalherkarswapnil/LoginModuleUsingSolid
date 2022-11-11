//
//  SingleResponsibility.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 06/10/22.
//

//At this point all of these methods are coupled into a single Student class that is used by different groups of users.
import Foundation

// Types of CaR CAN BE Drivable, Maintainable, and Comfortable
class Car
{
    func accelerate() {}
    func brake() {}
    func turnLeft() {}
    func turnRight() {}

    func addFuel() {}
    func changeOil() {}
    func rotateTires() {}

    func adjustDriverSeat() {}
    func turnOnAC() {}
    func playCD() {}
}

class Employee {
    //CFO
    func calculateSalary() {}

    //HR
    func calculateHours() {}
    //TECHNICAL
    func saveEmpData() {}

    private func getRegularHours() ->Int {
        return 0
    }
}
