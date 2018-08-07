//
//  Item.swift
//  Todoey
//
//  Created by Krystian Chrobok on 06/08/2018.
//  Copyright © 2018 Krystian Chrobok. All rights reserved.
//

import Foundation


// Encodable, Decodable = Codable
class Item: Codable {
    var title : String = ""
    var done : Bool = false
}
