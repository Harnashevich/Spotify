//
//  ViewController.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 17.10.23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.title = "Home"
        navigationController?.navigationBar.tintColor = .systemBackground
        view.backgroundColor = .red
    }
}

