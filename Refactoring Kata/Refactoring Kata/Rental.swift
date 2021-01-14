//
//  Rental.swift
//  Refactoring Kata
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import Foundation

public class Rental {
    public private(set) var movie: Movie
    public var daysRented: Int

    public init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }

    public func getCharges() -> Double {
        return movie.getCharges(daysRented: daysRented)
    }

    public func getFrequentRenterPoints() -> Int {
        return movie.getFrequentRenterPoints(daysRented: daysRented)
    }
}
