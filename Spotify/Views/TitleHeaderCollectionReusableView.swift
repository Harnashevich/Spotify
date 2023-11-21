//
//  TitleHeaderCollectionReusableView.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 21.11.23.
//

import UIKit

final class TitleHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "TitleHeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 15, y: 0, width: width - 30, height: height)
    }
    
    required init? (coder: NSCoder) {
        fatalError()
    }
    
    func configure(with title: String) {
        label.text = title
    }
}
