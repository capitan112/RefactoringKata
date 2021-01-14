//
//  Movie.swift
//  Refactoring Kata
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import Foundation

public enum PriceCode: Int {
    case regular = 0
    case newRelease = 1
    case childern = 2
}

protocol PriceProtocol {
    func getPriceCode() -> PriceCode
    func getCharges(daysRented: Int) -> Double
    func getFrequentRenterPoints(daysRented: Int) -> Int
}

class RegularPrice: PriceProtocol {
    func getFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
    
    func getCharges(daysRented: Int) -> Double {
        var result: Double = 2
        if daysRented > 2 {
            result += Double(daysRented - 2) * 1.5
        }

        return result
    }
    
    func getPriceCode() -> PriceCode {
        return PriceCode.regular
    }
}

class NewReleasePrice: PriceProtocol {
    func getFrequentRenterPoints(daysRented: Int) -> Int {
        if daysRented > 1 {
            return 2
        }
        
        return 1
    }
    
    func getCharges(daysRented: Int) -> Double {
        return Double(daysRented) * 3
    }
    
    func getPriceCode() -> PriceCode {
        return PriceCode.newRelease
    }
}

class ChildrenPrice: PriceProtocol {
    func getFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
    
    func getCharges(daysRented: Int) -> Double {
        var result: Double = 1.5
        if daysRented > 3 {
            result += Double(daysRented - 3) * 1.5
        }
    
        return result
    }
    
    func getPriceCode() -> PriceCode {
        return PriceCode.childern
    }
}

public class Movie {
    
    public private(set) var title: String
    public var priceCode: PriceCode
    private var price: PriceProtocol!

    init(title: String, priceCode: PriceCode) {
        self.title = title
        self.priceCode = priceCode
        setPriceCode(priceCode: priceCode)
    }
    
    private func setPriceCode(priceCode: PriceCode) {
        switch priceCode {
        case .regular:
            self.price = RegularPrice()
        case .newRelease:
            self.price = NewReleasePrice()
        case .childern:
            self.price = ChildrenPrice()
        }
    }
    public func getCharges(daysRented: Int) -> Double {
        price.getCharges(daysRented: daysRented)
    }
    
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return price.getFrequentRenterPoints(daysRented: daysRented)
    }
}
