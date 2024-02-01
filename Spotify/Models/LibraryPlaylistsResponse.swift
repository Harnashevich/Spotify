//
//  LibraryPlaylistsResponse.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 30.01.24.
//

import Foundation

struct LibraryPlaylistsResponse: Codable {
    let items: [Playlist]
}
