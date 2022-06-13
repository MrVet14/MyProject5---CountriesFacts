//
//  Country.swift
//  MyProject5 - CountriesFacts
//
//  Created by Vitali Vyucheiski on 4/29/22.
//

import Foundation

struct Country: Decodable {
    var country:String
    var capital: String
    var size: String
    var population: String
    var currency: String
    var headOfGov: String
    var language: String
}
