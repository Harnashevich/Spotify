//
//  Artist.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 17.10.23.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
