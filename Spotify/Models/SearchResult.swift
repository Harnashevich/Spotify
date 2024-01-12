//
//  SearchResult.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 8.01.24.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
