//
//  AlbumViewController.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 30.10.23.
//

import UIKit

class AlbumViewController: UIViewController {
    
    private let album: Album
    
    init (album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError ()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = album.name
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getAlbumDetails(for: album) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print(model)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
