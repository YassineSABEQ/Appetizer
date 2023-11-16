//
//  User.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 13/11/2023.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
