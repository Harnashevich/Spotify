//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 23.10.23.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
