//
//  Petition.swift
//  Project7
//
//  Created by Gavin Brown on 1/13/19.
//  Copyright © 2019 DevelopITLLC. All rights reserved.
//

import Foundation


struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions: Codable {
    var results:[Petition]
    
}

