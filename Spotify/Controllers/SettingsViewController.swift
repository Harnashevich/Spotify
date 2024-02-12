//
//  SettingsViewController.swift
//  Spotify
//
//  Created by Andrei Harnashevich on 17.10.23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        title = "Settings"
        view.backgroundColor = .systemBackground
        view.addSubviews(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        sections.append(Section(title: "Profile", options: [Option(title: "View Your Profile", handler: { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.viewProfile()
            }
        })]))
        
        sections.append(Section(title: "Account", options: [Option(title: "Sing Out", handler: { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.signOutTapped()
            }
        })]))
    }
    
    private func viewProfile() {
        let vc = ProfileViewController()
        vc.title = "Profile"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated:true)
    }
    
    private func signOutTapped() {
           let alert = UIAlertController(title: "Sign Out",
                                         message: "Are you sure?",
                                         preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
                AuthManager.shared.signOut { [weak self] signedOut in
                    if signedOut {
                        DispatchQueue.main.async {
                            let navVC = UINavigationController(rootViewController: WelcomeViewController())
                            navVC.navigationBar.prefersLargeTitles = true
                            navVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
                            navVC.modalPresentationStyle = .fullScreen
                            self?.present(navVC, animated: true, completion: {
                                self?.navigationController?.popToRootViewController(animated: false)
                            })
                        }
                    }
                }
            }))
            present(alert, animated: true)
        }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Call handler for cell
        let model = sections[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = sections[section]
        return model.title
    }
}
