//
//  PlaylistHeaderCollecionReusableView.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 13.11.23.
//

import UIKit
import SDWebImage

protocol PlaylistHeaderCollecionReusableViewDelegate: AnyObject {
    func playlistHeaderCollecionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollecionReusableView)
}

class PlaylistHeaderCollecionReusableView: UICollectionReusableView {
    
    static let identifier = "PlaylistHeaderCollecionReusableView"
    
    weak var delegate: PlaylistHeaderCollecionReusableViewDelegate?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let descriptionlabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let ownerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private let playAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews(
            imageView,
            nameLabel,
            descriptionlabel,
            ownerLabel,
            playAllButton
        )
        
        playAllButton.addTarget(
            self,
            action: #selector(didTapPlayAll),
            for: .touchUpInside
        )
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize: CGFloat = height / 1.8
        imageView.frame = CGRect(
            x: (width - imageSize) / 2,
            y: 20,
            width: imageSize,
            height: imageSize
        )
        
        nameLabel.frame = CGRect(
            x: 10,
            y: imageView.bottom,
            width: width-20,
            height: 44
        )
        descriptionlabel.frame = CGRect(
            x: 10,
            y: nameLabel.bottom,
            width: width-20,
            height: 44
        )
        ownerLabel.frame = CGRect(
            x: 10,
            y: descriptionlabel.bottom,
            width: width-20,
            height: 44
        )
        
        playAllButton.frame = CGRect(
            x: width - 80,
            y: height - 80,
            width: 60,
            height: 60
        )
    }
    
    @objc private func didTapPlayAll() {
        delegate?.playlistHeaderCollecionReusableViewDidTapPlayAll(self)
    }
    
    func conigure(with viewModel: PlaylistHeaderViewViewModel) {
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionlabel.text = viewModel.description
        imageView.sd_setImage(with: viewModel.artworkURL, placeholderImage: UIImage(named: "photo"))
    }
}
