//
//  OpenClosePrinciple.swift
//  LoginModuleUsingSolid
//
//  Created by macmini41 on 06/10/22.
//

import Foundation


class Scrapper {

    func scrapVehicles() {
        let cars = [
            MototorCar(brand: "Ford"),
            MototorCar(brand: "Peugeot"),
            MototorCar(brand: "Toyota"),
        ]

        cars.forEach { car in
            print(car.getScrappingAddress())
        }

        let trucks = [
            Truck(brand: "Volvo"),
            Truck(brand: "Nissan"),
        ]

        trucks.forEach { truck in
            print(truck.getScrappingAddress())
        }
    }
}

class MototorCar {
    let brand: String

    init(brand: String) {
        self.brand = brand
    }

    func getScrappingAddress() -> String {
        return "Cars scrapping address"
    }
}

class Truck {
    let brand: String

    init(brand: String) {
        self.brand = brand
    }

    func getScrappingAddress() -> String {
        return "Trucks scrapping address"
    }
}

///For each new type of vehicle, the getScrapingAddress() function must be implemented again, which breaks the principle of open/closed. To solve this point, we introduce the Scrappable protocol that contains the getScrappingAddress() method:
//class Car {
//    let name: String
//    let color: String
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//   func printDetails() -> String {
//        return "I have \(self.color) color \(self.name)."
//    }
//}
//class Logger {
//    func printData() {
//        let cars = [ Car(name: "BMW", color: "Red"),
//                     Car(name: "Audi", color: "Black")]
//         cars.forEach { car in
//             print(car.printDetails())
//         }
//     }
//}
//class Bike {
//    let name: String
//    let color: String
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//    func printDetails() -> String {
//        return "I have \(self.name) bike of color \(self.color)."
//    }
//}
//class Logger {
//    func printData() {
//        let cars = [ Car(name: "BMW", color: "Red"),
//                     Car(name: "Audi", color: "Black")]
//         cars.forEach { car in
//             print(car.printDetails())
//         }
//        let bikes = [ Bike(name: "Homda CBR", color: "Black"),
//                      Bike(name: "Triumph", color: "White")]
//        bikes.forEach { bike in
//             print(bike.printDetails())
//         }
//     }
//}
