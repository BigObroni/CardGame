//
//  Card.swift
//  CardGameProject
//
//  Created by Nevan Bingham on 8/19/21.
//

import Foundation

struct Card: Decodable {
    
    let value: String
    let suit: String
    let image: URL
}

struct TopLevelObject: Decodable {
        
    let cards: [Card]
    let success: Bool
    
}
