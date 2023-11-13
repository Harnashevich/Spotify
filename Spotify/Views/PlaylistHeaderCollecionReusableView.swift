//
//  PlaylistHeaderCollecionReusableView.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 13.11.23.
//

import UIKit
import SDWebImage

class PlaylistHeaderCollecionReusableView: UICollectionReusableView {
     static let identifier = "PlaylistHeaderCollecionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
