//
//  Customer.swift
//  Refactoring Kata
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import Foundation

public class Customer {
    public var name: String
    private var rentals: [Rental] = []

    public init(name: String) {
        self.name = name
    }

    public func add(rental: Rental) {
        rentals.append(rental)
    }

    private func getTotalCharge() -> Double {
        var totalAmount: Double = 0

        for rental in rentals {
            totalAmount += rental.getCharges()
        }

        return totalAmount
    }

    private func getFrequentRenterPoints() -> Int {
        var frequentRenterPoints: Int = 0

        for rental in rentals {
            frequentRenterPoints += rental.getFrequentRenterPoints()
        }

        return frequentRenterPoints
    }

    public func statement() -> String {
        var result: String = "Rental Record for \(name)\n"
        for rental in rentals {
            result += "\t\(rental.movie.title)\t\(rental.getCharges())\n"
        }

        // add footer lines
        result += "Amount owed is \(getTotalCharge())\n"
        result += "You earned \(getFrequentRenterPoints()) frequent renter points\n"

        return result
    }
}
