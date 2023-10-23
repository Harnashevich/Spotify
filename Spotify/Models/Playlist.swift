//
//  Playlist.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 17.10.23.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
