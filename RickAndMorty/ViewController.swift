//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var identifier = "mainCell"
    var results: Results?
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkDataFetcher.shared.fetchHeroes { result in
            guard let result = result else {
                return
            }
            self.results = result
            self.mainTableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.heroes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as?  CustomTableViewCell {
            let hero = results?.heroes[indexPath.row]
            cell.nameLabel.text = hero?.name
            cell.genderLabel.text = hero?.gender
            cell.speciesLabel.text = hero?.species
            cell.avatarImageView.layer.cornerRadius = 10
            cell.avatarImageView.sd_setImage(with: URL(string: hero?.image ?? ""))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //MARK: - UITableViewDataSource
}
