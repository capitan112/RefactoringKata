//
//  Refactoring_KataTests.swift
//  Refactoring KataTests
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

@testable import Refactoring_Kata
import XCTest

class Refactoring_KataTests: XCTestCase {
    var customer: Customer!
    override func setUp() {
        customer = Customer(name: "Alex")
    }

    override func tearDown() {
        customer = nil
    }

    func testForOneMovieShouldReturnOneMovie() {
        let movie = Movie(title: "Movie", priceCode: .newRelease)
        let rental = Rental(movie: movie, daysRented: 2)

        customer.add(rental: rental)

        XCTAssertEqual("Rental Record for Alex\n\tMovie\t6.0\nAmount owed is 6.0\nYou earned 2 frequent renter points\n", customer.statement())
    }

    func testForOneMovieForChildrenShouldReturnOneMovieForChilder() {
        let movie = Movie(title: "Movie", priceCode: .newRelease)
        let movie2 = Movie(title: "Movie 2", priceCode: .childern)
        let movie3 = Movie(title: "Movie 3", priceCode: .regular)

        let rental = Rental(movie: movie, daysRented: 1)
        let rental2 = Rental(movie: movie, daysRented: 3)

        let rental3 = Rental(movie: movie2, daysRented: 1)
        let rental4 = Rental(movie: movie2, daysRented: 4)

        let rental5 = Rental(movie: movie3, daysRented: 1)
        let rental6 = Rental(movie: movie3, daysRented: 4)

        customer.add(rental: rental)
        customer.add(rental: rental2)
        customer.add(rental: rental3)
        customer.add(rental: rental4)
        customer.add(rental: rental5)
        customer.add(rental: rental6)

        XCTAssertEqual("Rental Record for Alex\n\tMovie\t3.0\n\tMovie\t9.0\n\tMovie 2\t1.5\n\tMovie 2\t3.0\n\tMovie 3\t2.0\n\tMovie 3\t5.0\nAmount owed is 23.5\nYou earned 7 frequent renter points\n", customer.statement())
    }
}
